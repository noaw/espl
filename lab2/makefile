all: complines testnl canalyze

complines: complines.o
	gcc complines.o  -o complines

complines.o: complines.c
	gcc -c complines.c

testnl: testnl.o namelist.o

testnl.o: testnl.c namelist.h
namelist.o: namelist.c namelist.h


canalyze: canalyze.o namelist.o
	gcc canalyze.c namelist.c -o canalyze

canalyze.o: canalyze.c
	gcc -c canalyze.c

namelist.o: namelist.c
	gcc -c namelist.c