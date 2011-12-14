#include <stdio.h>
#include <string.h>
#include "font.h"

int main(int argc, char *argv[]){
    int i;
    int j;
    int iline;
    int pline;
    char *(*space)[SYMBOL_HEIGHT] = &alphabet[0];
    //loop for each line
    for (pline=0; pline<=SYMBOL_HEIGHT; pline++){
      //loop for each argument
      for (i=1;i<argc;i++){
	//loop for each char at argument
	for (j=0; j<strlen(argv[i]); j++){
	  int idx = argv[i][j]-' ';
	  char *(*symbol)[SYMBOL_HEIGHT] = &alphabet[idx];
	  printf("%s", (*symbol)[pline]);
	}
	printf("%s", (*space)[pline]);
      }
    //printf("%s ",argv[i]);
    //if (i<argc-1 && j<strlen(argv[i])-1){
      printf("\n");
    //}
  }
}