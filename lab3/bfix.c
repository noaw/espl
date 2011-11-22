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

	
   if ((file = fopen(file1, "r+")) == NULL){
      printf("No file \n");
      return 1;
    }

	
   if ((bcmp = fopen(file2, "r")) == NULL){
      printf("No bcmp-file \n");
      return 1;
    }
    
	 struct diff diff;
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
	char *difLine;
	char b = 'b';
	
	while ((difLine = fgets(a, 129, bcmp)) != NULL){
	      fputdiff(stdin, parsediff(difLine, &diff));
	      fseek(file, diff.offset, 0);
	      fread(&b,1,1,file);
	      fseek(file, diff.offset, 0);
	      if (rflag==0){
		if (b==diff.old){
		  fputc(diff.new, file);
		  if (mflag==1)
		    printf("replaced \'%c\' with \'%c\' on place %ld\n",diff.old,diff.new,diff.offset);
		}
		else printf("no replacement: \'%c\' instead of \'%c\' on place %ld\n",b,diff.old,diff.offset);
	      }
	      else {
		if (b==diff.new){
		fputc(diff.old, file);
		  if (mflag==1)
		    printf("replaced \'%c\' with \'%c\' on place %ld\n",diff.new,diff.old,diff.offset);
		}
		else printf("no replacement: \'%c\' instead of \'%c\' on place %ld\n",b,diff.new,diff.offset);
	      }      
	}
	
	fclose(bcmp);
	fclose(file);
	
	return 1;
}