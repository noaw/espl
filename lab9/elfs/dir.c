#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <dirent.h>
#include <sys/stat.h>

int main(int argc, char **argv) {
  
  int c;
  int lflag = 0;
  
  
  while ((c = getopt (argc, argv, "hl")) != -1)
    switch (c)
      {
      case 'h':
	printf("dir prints a list of files in the directory specified as the argument,\non file per line. If the directory name is not specified,\nthe list of files in the current directory is printed.\nOptions:\n-l print file size in bytes before the file name\nEnjoy!\n");
	return 0;
      case 'l':
	lflag = 1;
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
  
    DIR *dire;
    struct dirent *dit;
    struct stat file_status;
    
    char *dirName = argv[2];
    
    if ((dire = opendir(argv[2])) == NULL)
        {
                printf("Couldn't find directory %s, exiting\n",dirName);
                return 0;
        }
        
     printf("Deading from directory \"%s\":\n",dirName);
    
    int i=0;
    while ((dit = readdir(dire)) != NULL)
        {
		if (i>0)
		  printf("\n");
		if (lflag==1){
		  stat(dit->d_name, &file_status);
		  printf("%zd ", file_status.st_size);
		}
                printf("%s", dit->d_name);
		i++;
        }
    
    printf("\n");
    closedir(dire);
  
}
