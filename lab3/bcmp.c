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
	char a[129];
	char b[129];
	int row = 1;
	
	while (fgets(a, sizeof(a), file1) != NULL){
		fgets(b,sizeof(b), file2);
		//printf(a);
	        //printf(b);
		//printf("row num: %d \n",row);
		//for (j=0; j<=sizeof(a); j++){
		for (j=0; j<=10; j++){
		  //printf("%c %c \n",a[j],b[j]);
		  if (a[j]!=b[j]){
		    printf("byte %d %c %c",j,a[j],b[j]);
		    //j = sizeof(a)+1;
		    j = 11;
		}
	}
	row=row+1;
	}
	
	printf("\n");
	return 1;
}