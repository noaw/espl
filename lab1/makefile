.PHONY: all

all: prsym ascart


prsym: prsym.o font.o
	gcc -o $@ $^

ascart: ascart.o font.o
	gcc -o $@ $^

prsym.o: prsym.c font.h
	gcc -c -o prsym.o prsym.c

font.o: font.c font.h
	gcc -c -o font.o font.c

ascart.o: ascart.c font.h
	gcc -c -o ascart.o ascart.c