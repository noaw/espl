#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <assert.h>
#include "fgetname.h"

char *fgetname(char *name, int size, FILE *stream) {
	int ich;
	int ch;

	assert(size>0); /* the buffer must have space in it */

	/** before a name */
	for(;;) {
		ch = fgetc(stream);
		if(ch==EOF) /* end of stream or error before a name */
			return NULL;
		if(isalpha(ch) || ch=='_') /* a name begins */
			break; 
	}
		
	/** reading the name */
	ich = 0;
	for(;;) {
		/* a name character */
		if(ich!=size-1) /* add the character if space left */
			name[ich++] = ch;

		ch = fgetc(stream);
		if(ch==EOF) /* name ends at end of file */
			break;
		if(!(isalnum(ch) || ch=='_')) {
			ungetc(ch, stream); /* end of the name,
								   return the character to the stream */
			break;
		}
	}
	assert(ich<=size-1); /* truncated if too long */
	name[ich] = '\0';

	return name;
}
		
