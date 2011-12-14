#include <stdio.h>
#include <string.h>
#include "font.h"

int write(int,const char*,int);
int length(char *s);
int printme(char* sp);

int ascart(int argc, char *argv[]){
    int i;
    int j;
    int iline;
    int pline;
    char *(*space)[SYMBOL_HEIGHT] = &alphabet[0];
    //loop for each line
    for (pline=0; pline<=SYMBOL_HEIGHT; pline++){
      //loop for each argument
      for (i=0;i<argc-1;i++){
	//loop for each char at argument
	for (j=0; j<length(argv[i+1]); j++){
	  innerFunction(i+1,j,argv,pline,SYMBOL_HEIGHT);
	}
	printme((*space)[pline]);
      }
      printme("\n");
  }
}

int calculateIdx(int i, int j, char *argv[]){
  return argv[i][j]-' ';
}

int innerFunction(int i, int j, char *argv[], int pline, char *(*space)[SYMBOL_HEIGHT]){
  int idx = calculateIdx(i,j,argv);
  printLineOfSymbol(pline, idx, SYMBOL_HEIGHT);
}

int printLineOfSymbol(int pline, int idx, char *(*space)[SYMBOL_HEIGHT]){
  char *(*symbol)[SYMBOL_HEIGHT] = &alphabet[idx];
  printme((*symbol)[pline]);
  return 0;
}