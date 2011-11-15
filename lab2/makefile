all: complines testnl try canalyze

complines: complines.o
	gcc complines.o  -o complines

complines.o: complines.c
	gcc -c complines.c

testnl: testnl.o namelist.o

testnl.o: testnl.c namelist.h
namelist.o: namelist.c namelist.h

# try: try.o
#	gcc try.c -o try

#try.o: try.c
#	gcc -c try.c

#canalyze: canalyze.o namelist.o keywords.o
#	gcc canalyze.c namelist.c keywords.c -o canalyze

canalyze: canalyze.o namelist.o
	gcc canalyze.c namelist.c -o canalyze

canalyze.o: canalyze.c
	gcc -c canalyze.c

namelist.o: namelist.c
	gcc -c namelist.c

#keywords.o: keywords.c
#	gcc -c keywords.c