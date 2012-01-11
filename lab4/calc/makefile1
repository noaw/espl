.PHONY: all clean

all: calc1

calc1: calc1.o atod.o
	gcc calc1.o atod.o -m32 -o calc1

calc1.o: calc1.c
	gcc -m32 -c calc1.c

atod.o: atod.c
	gcc -c -m32 -S -masm=intel atod.c
#	gcc -m32 -c atod.c

#atod.s: atod.c
	

clean:
	rm *.o calc1