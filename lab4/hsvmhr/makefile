%.o: %.asm
	nasm -g -f elf -o $@ $<

.PHONY: clean all

all: check


check: check.o hsvmhr.o
	gcc -m32 -o check check.o hsvmhr.o

check.o: check.c
	gcc -m32 -c check.c 

clean:
	rm *.o check
