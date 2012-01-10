#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>

#define BUF_LEN 1024
static char command[BUF_LEN+1];
static int argc;
static char *argv[BUF_LEN+1];

/* read command and remove end of line if present */
int read_command() {
  int len;

  if(fgets(command, BUF_LEN, stdin)) {
    len = strlen(command);
    if(len>0 && command[len-1]=='\n')
      command[len-1] = '\0';
    return 1;
  } 
  
  return 0;
}

#define NO_SEP '\0'
#define EOC '\1'

/* split the command line into arguments and fill argv with pointers
   to the arguments */
void split_command() {
  char *s, sep;
  int between;

  between = 1;
  argc = 0;
  sep = NO_SEP;
  for(s = command; *s; ++s) {
    switch(*s) {
    case '\"': case '\'':
      if(sep==NO_SEP) {
        sep = *s;
      } else if(sep==*s) {
        sep = '\0';
      } 
      break;
    case '\\':
      ++s;
      break;
    case ' ':
      if(!sep) {
        between = 1;
        *s = '\0';
        continue;
      }
      break;
    }
    if(between) {
      argv[argc++] = s;
      between = 0;
    }
  }
  argv[argc] = NULL;
}

/* expand arguments, substitute shell variable values etc. */
void expand_args() {
  char **a = argv;
  while(*a) {
    if(**a=='"' || **a=='\'') { /* TODO: quotes can be in any place */
      *a = strdup(*a);
      memmove(*a, *a+1, strlen(*a));
      (*a)[strlen(*a)-1] = 0;
    } else {
      *a = strdup(*a);
    }
    /* TODO: eliminate escapes \ */
    /* TODO: expand environment variables */
    ++a;
  }
}

/* free arguments allocated during expansion */
void free_args() {
  char **a = argv;
  while(*a) {
    free(*a);
    ++a;
  }
}

  

/* run an external program */
void run_program() {
  int pid, status;
  static char ststr[8];
  int pindex = -1;
  int id = 1;
  int i;
  char check = 'a';
  int p[2];

  /* TODO: input, output redirection */
  /* TODO: pipelines */
  /* TODO: background commands */
  
  
   for (i=0; i<argc; i++){
     if (argv[i][0]=='|'){
	pindex = i;
	check = '|';
	break;
      }
   }
    
    
    if (check=='|'){
      //printf("found | in index %d\n",pindex);     
      if (pipe(p)) {
	printf("error in pipe");
      }
      if ((id=fork())==0) {
	dup2 (p[0],0);
	execvp(argv[pindex], argv+pindex+1);
      }
    }
    
  //printf("still here\n");

  if ((pindex==-1) && (argc>2)){
    check = argv[argc-2][0];
    //printf("changing pindex to %d\n",check);
  }

  //printf("still here2\npindex is: %d\n",pindex);

 if(((pid=fork())>0) & (id>0)) {
    waitpid(pid, &status, 0);
    sprintf(ststr, "%d", status);
    setenv("?", ststr, 1);
  }
  else if(pid==0) {
  
    //printf("inside before\n");
    
    if (check=='|'){
     //printf("I'm here!!");
     int outputfd = p[1];
     if (dup2(outputfd,1))
	argv[pindex]=NULL;
    }
    
    
    else if (check=='>'){ 
      //printf("found >\n");
      int f = open(argv[argc-1],O_WRONLY | O_TRUNC | O_CREAT,0777);
      //close(1);
      //printf("fff %d\n", f);
      dup2(f,1);
      argv[argc-2] = NULL;
    }
    
    
    else if (check='<'){  
      // printf("found <\n");
      int f = open(argv[argc-1],O_RDONLY);
      //close(0);
      //printf("fff %d\n", f);
      dup2(f,0);
      argv[argc-2] = NULL;
    }
    
 
 
    execvp(argv[0], argv);
    perror(argv[0]);
    
  } else {
    perror(getenv("SHELL")); /* problem while forking, not due to a particular program */
  }
}

int main(int _argc, char **_argv) {
  /* clear shell variables and re-assign a minimum set */
  clearenv();
  setenv("PATH", ":/bin:/usr/bin", 1);
  setenv("PROMPT", "$ ", 1);
  setenv("SHELL", _argv[0], 1);

  signal(SIGINT, SIG_IGN); /* ignore ^C */

  while(1) {
    printf("%s", getenv("PROMPT"));
    if(!read_command())
      break;
    split_command();
    if(!argc)
      continue;
    expand_args();
    /* process builtin commands */
    if(!strcmp(argv[0],"exit")) {
      break;
    } else if(!strcmp(argv[0],"set")) {
      if(argc!=3) {
        fprintf(stderr, "set: two arguments required\n");
        continue;
      }
      setenv(argv[1], argv[2], 1);
    } else if(!strcmp(argv[0], "cd")) {
      if(argc!=2) {
        fprintf(stderr, "cd: one argument required\n");
        continue;
      }
      if(chdir(argv[1])==-1) {
        perror("cd");
      }
    } else if(!strcmp(argv[0], "pwd")) {
      if(argc!=1) {
        fprintf(stderr, "pwd: no arguments allowed\n");
        continue;
      }
      printf("%s\n", getcwd(command, BUF_LEN));
    } else {
      /* run external command */
      run_program();
    }
    free_args();
  }
  printf("\n");

  return 0;
}
    

    
