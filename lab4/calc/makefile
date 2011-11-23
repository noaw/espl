.PHONY: all clean

all: calc1

#calc1: calc1.o atod.o
#	gcc -o $@ $^
#
#calc1.o: calc1.c
#
#atod.o: atod.c

calc1: calc1.o atod.o
	gcc calc1.o atod.o -o calc1

calc1.o: calc1.c
	gcc -c calc1.c

atod.o: atod.c
	gcc -c -m32 -S -masam=intel atod.c

clean:
	rm *.o calc1