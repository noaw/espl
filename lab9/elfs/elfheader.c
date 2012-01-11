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
  
  
  
  Elf32_Ehdr elf;
  Elf32_Shdr res;
  
  FILE * f1 = NULL;
	
   if ((f1 = fopen(argv[optind], "r")) == NULL){
      printf("No file1 \n");
      return 1;
    }
  
  /*
  f1 = open(argv[optind], O_RDONLY);
  if(f1==-1) {
     perror(argv[optind]);
     exit(1);
  }
  */
  
  fread(&elf, sizeof(elf),sizeof(elf),f1);
  int i;
  char names[1000];
  //int names[elf.e_shnum];
  int name;
  //strcmp(names,name)==0
  
  // print details
  printf("Magic: ");
  for(i=0; i<EI_INDENT; i++){
	  printf("%x ", elf.e_ident[i]);
  }
  printf("\nClass: ");
  printf("\nData: ");
  printf("\nVersion: %d",elf.e_version);
  printf("\nOS/ABI: ");
  printf("\nABI Version: ");
  printf("\nType: %x", elf.e_type);
  printf("\nMachine: %x", elf.e_machine);
  printf("\nVersion: ");
  printf("\nEntry point address: 0x%x", elf.e_entry);
  printf("\nStart of program headers: %d (bytes into file)", elf.e_phoff);
  printf("\nStart of section headers: %d (bytes into file)", elf.e_shoff);
  printf("\nFlags: 0x0");
  printf("\nSize of this header: %d (bytes)", elf.e_ehsize);
  printf("\nSize of program headers: %d (bytes)", elf.e_phentsize);
  printf("\nNumber of program headers: %d", elf.e_phnum);
  printf("\nSize of section headers: %d (bytes)", elf.e_shentsize);
  printf("\nNumber of section headers: %d", elf.e_shnum);
  printf("\n==============================\n");

  
   Elf32_Off loc = elf.e_shoff;
   printf("loc is: %d\n",loc);
	
  if (sec_flag==1){
    printf("Section headers - numer of sections is %d:\n",elf.e_shnum);
    printf("[Nr] Name            Addr        Size\n");
    fseek(f1,loc,0);
    //for(i=0; i<elf.e_shnum; i++){
    for(i=0; i<5; i++){
      //fread(f1,res,sizeof(res));
      fread(&res,sizeof(res),sizeof(res),f1);
      printf("%x %x\n",res.sh_addr,res.sh_size);
      loc = loc + res.sh_addr;
      printf("loc is: %d\n",loc);
      fseek(f1,res.sh_offset,loc);
      loc = loc + res.sh_offset;
    }
    
    
  }
  
  /*
    if (sym_flag==1){
	  
    }
  */

  close(f1);
  
}
