#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <dirent.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <elf.h>

#define EI_INDENT 16

int main(int argc, char **argv) {
  int c;
  int sec_flag = 0;
  int sym_flag = 0;
  
  while ((c = getopt (argc, argv, "Ss")) != -1)
    switch (c)
      {
      case 'S':
	sec_flag = 1;
	break;
      case 's':
	sym_flag = 1;
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
  
  int f1;
  
  Elf32_Ehdr elf;
  Elf32_Shdr res;

  f1 = open(argv[optind], O_RDONLY);
  if(f1==-1) {
     perror(argv[optind]);
     exit(1);
  }
  read(f1, &elf, sizeof(elf));
  int i;
  Elf32_Off loc = elf.e_shoff;
  printf("loc is: %d\n",loc);
  
  
  if (sec_flag==1){
    printf("Section headers - numer of sections is %d:\n",elf.e_shnum);
    printf("[Nr] Name            Addr        Size\n");
    lseek(f1,loc,0);
    //for(i=0; i<elf.e_shnum; i++){
    for(i=0; i<5; i++){
      read(f1,res,sizeof(res));
      printf("%x %x\n",res.sh_addr,res.sh_size);
      loc = loc + res.sh_addr;
      printf("loc is: %d\n",loc);
      lseek(f1,loc,0);
    }
    
    
  }
  
  /*
    if (sym_flag==1){
	  
    }
  */

  close(f1);
  
}
