#include <stdlib.h>
#include <stdio.h>
#include "fgetname.h"

int main(int argc, char **argv) {
	FILE *stream = fopen("fgetname.c", "r");
	char name[64];
	if(!stream) {
		fprintf(stderr, "run the test in the source directory\n");
		return 1;
	}

	while(fgetname(name, sizeof(name), stream))
		printf("%s\n", name);

	fclose(stream);

	return 0;
}

	

