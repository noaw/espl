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

  
   cpid = fork();
   /*
   if (cpid == -1) {
     perror("fork");
     exit(EXIT_FAILURE);
   }
   */
   
   if (cpid){
    wait(&status);
    printf("exit status: %ld\n", (long)status);
   }
   else {
    execvp(argv[1],argv+1);
    printf("running error");
   } 

  return 1;
}