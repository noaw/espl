%.o: %.asm
	nasm -g -f elf -o $@ $<

%.o: %.c
	gcc -m32 -g -nostdlib -fno-stack-protector -c -o $@ $<

.PHONY: clean all

all: bcmp

bcmp: start.o write.o puts.o bcmp.o atod.o fopen.o fread.o feof.o fclose.o
	ld -melf_i386 -g -o $@ $^

start.o: start.asm
write.o: write.asm
main.o: main.c
puts.o: puts.c
bcmp.o: bcmp.c
atod.o: atod.asm
fopen.o: fopen.asm
fread.o: fread.asm
feof.o: feof.asm
fclose.o: fclose.asm

clean:
	rm *.o bcmp
