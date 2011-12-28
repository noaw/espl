#include <sys/wait.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

int main(int argc, char **argv){
  int i;
  for (i=1; i<argc; i++){
    printf("%s ",argv[i]);
  }
  printf("\n");
  pid_t cpid;
  int status;

  /*
   cpid = fork();
   if (cpid == -1) {
     perror("fork");
     exit(EXIT_FAILURE);
   }
   */
   execvp(argv[1],argv);
   wait(&status);
   printf("exit code: %ld\n", (long)status);

}