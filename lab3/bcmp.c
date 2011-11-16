#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv) {
	char *filename1 = argv[1];
	char *filename2 = argv[2];
	
	FILE * file1 = NULL;
	FILE * file2 = NULL;

	
   if ((file1 = fopen(filename1, "r")) == NULL){
      printf("No file1 \n");
      return 1;
    }

	
   if ((file2 = fopen(filename2, "r")) == NULL){
      printf("No file2 \n");
      return 1;
    }
	  
	
	int j;
	char a[1];
	char b[1];
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
	
	while (count<minend) {
	    fgets(a, sizeof(a), file1);
	    fgets(b, sizeof(b), file2);
	    printf("%d: a: %c - b: %c\n",count,a[0],b[0]);
		 if (a[0]!=b[0]){
		    printf("byte %d -%s +%s\n",count,a,b);
		  
		}
	  count++;
	 }
	 
	
	
	printf("\n");
	return 1;
}