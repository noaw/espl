#ifndef FGETNAME_H
#define FGETNAME_H

/** Reads next name from the stream, truncates the name to size-1
    characters if the name is too long. Returns name on success, NULL
	on error or when no name was found. 

    A name is a sequence of letters, digits, or '_' not starting
    with a digit. */
char *fgets(char *name, int size, FILE *stream);

#endif
