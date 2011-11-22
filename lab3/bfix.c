#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>
#include <unistd.h>
#include "diff.h"


int main(int argc, char **argv) {
	char *file1 = argv[1];
	char *file2 = argv[2];
	
	FILE * file = NULL;
	FILE * bcmp = NULL;

	
   if ((file = fopen(file1, "w")) == NULL){
      printf("No file \n");
      return 1;
    }
    
    fclose(file);

	
   if ((bcmp = fopen(file2, "r")) == NULL){
      printf("No bcmp-file \n");
      return 1;
    }
	  
	
	int j;
	int row = 1;
	int count = 1;
	char *char1;
	
	/*
	fseek(file1, 0L, SEEK_END);
	int end1 = ftell(file1);
	fseek(file2, 0L, SEEK_END);
	int end2 = ftell(file2);
	printf("1: %d , 2: %d\n",end1,end2);
	int minend = end1;
	if (end2<end1)
	  minend = end2;
	*/
	int minend=27;

	
	//fread(a, sizeof(char), 1, file1);
	 
	 int rflag = 0;
	 int mflag = 0;
	 int c;
	 opterr = 0;

	 

	 
      while ((c = getopt (argc, argv, "hrm")) != -1)
	switch (c)
	  {
	  case 'h':
	    printf("The options for bfix:\n-r reverses the changes\n-m prints message every time a change is done\nEnjoy!\n");
	    return 0;
	  case 'r':
	    rflag = 1;
	    break;
	  case 'm':
	    mflag = 1;
	    break;
	  case '?': 
             if (optopt == 'c')
               fprintf (stderr, "Option -%c requires an argument.\n", optopt);
             else if (isprint (optopt))
               fprintf (stderr, "Unknown option `-%c'.\n", optopt);
             else
               fprintf (stderr,
                        "Unknown option character `\\x%x'.\n",
                        optopt);
             return 1;
           default:
             abort ();
           }
  
	char a[129];
	
	while (fgets(a, sizeof(a), bcmp) != NULL){
	      struct diff diff;
	      fputdiff(stdout, parsediff(a, &diff));
	      file = fopen(file1, "w");
	      fseek(file, diff.offset, SEEK_SET);
	      //char *new = diff.new;
	      fwrite("X", 1, 1, file);
	      fclose(file);
	      
	}
	
	fclose(bcmp);
	
	printf("\n");
	return 1;
}