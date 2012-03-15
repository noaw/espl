#include <stdlib.h>
#include <stdio.h>
#include "namelist.h"
//#include "keywords.h"
#include <string.h>
#include <assert.h>

int cmp_by_name(const void *a, const void *b) 
{ 
    const struct namestat *ia = (const struct namestat *)a;
    const struct namestat *ib = (const struct namestat *)b;
    return strcmp((*ia).name, (*ib).name);
} 

int main(int argc, char **argv) {
  
  
	char *filename = NULL;
	
	FILE * file = NULL;
	
	char words[32][20] = {"auto", "double", "int", "long", "break", "else", "long", "switch", "case", "enum", "register", "typedef", "char", "extern", "return", "union", "const", "float", "short", "unsigned", "continue", "for", "signed", "oid", "default", "goto", "sizeof", "volatile", "do", "if", "static", "while"};	  
	
	int i;
	int count=0;
	char a[129];
	char b[129];
	int row = 1;
	char word[20];
	char *pointer = NULL;
	int add = 1;
	int fileCounter = 0;
	namelist nl = make_namelist();
	
	for (fileCounter = 1; fileCounter<argc; fileCounter++){
	  filename = argv[fileCounter];
	  if ((file = fopen(filename, "r")) == NULL){
	    printf("No file %d: %s \n",i,filename);
	    return 1;
	  }
	  
	  while (fgets(a, sizeof(a), file) != NULL){	  
	    //printf ("Splitting string \"%s\" into tokens:\n",a);
	    pointer = strtok (a," ,.-\(){}\n;*^%#@!?+_'\"<>[]");
	    while (pointer != NULL)
	    {
	      for (i=0; i<sizeof(words); i++){
		if (strcmp(pointer,words[i])==0){
		  add = 0;
		}
	      }
	      if (add==1 && isalpha(pointer[1])){
		add_name(nl,pointer);
	      }
	      pointer = strtok (NULL," ,.-\(){}\n;*^%#@!?+_'\"<>[]");
	      add = 1;
	    }
	    
	  }
	  fclose(file);
	}
	
	qsort(nl->names, nl->size, sizeof(struct namestat), cmp_by_name);
	printf("Here is the list: \n");
	for(i = 0; i!=nl->size; ++i) {
	  printf("%s %d\n",nl->names[i].name,nl->names[i].count);
	}
	
	//printf("\n");
	return 1;
}