#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <dirent.h>
#include <sys/stat.h>

#include <elf.h>

int main(int argc, char **argv) {
  
  ELF32_Ehdr elf;
  fread(&header, sizeof(header), fin);
  
}
