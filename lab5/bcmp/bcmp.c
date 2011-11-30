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
	  
	int count = 0;
	char a = 'a';
	char b = 'b';
	
	while (!(feof(file1)) | !(feof(file2))) {
	    fread(&a, 1, 1, file1);
	    fread(&b, 1, 1, file2);
	     if (a!=b){
		//puts("byte %d -%d +%d\n",count,a,b);
		puts(atod(count));
		puts(" -");
		//puts(atod(a));
		puts(a);
		puts(" +");
		//puts(atod(b));
		puts(b);
		puts("\n");
		}
	  count++;
	 }
	 
	fclose(file1);
	fclose(file2);
	
	return 1;
}