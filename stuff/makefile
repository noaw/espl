%.o: %.asm
	nasm -g -f elf -o $@ $<

%.o: %.c
	gcc -m32 -g -nostdlib -fno-stack-protector -c -o $@ $<

.PHONY: all

all: try

try: start.o try.o try2.o
	ld -melf_i386 -g -o $@ $^

start.o: start.asm
try2.o: try2.asm	
try.o: try.c

clean:
	rm *.o ahalan