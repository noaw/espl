%.o: %.asm
	nasm -g -f elf -o $@ $<

.PHONY: all clean

all: calc1

calc1: calc1.o atod.o
	gcc calc1.o atod.o -m32 -o calc1

calc1.o: calc1.c
	gcc -m32 -c calc1.c

clean:
	rm *.o calc1