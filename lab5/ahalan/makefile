%.o: %.asm
	nasm -g -f elf -o $@ $<

%.o: %.c
	gcc -m32 -g -nostdlib -fno-stack-protector -c -o $@ $<

.PHONY: clean all

all: ahalan

ahalan: start.o main.o ahalan.o write.o puts.o
	ld -melf_i386 -g -o $@ $^

ahalan.o: ahalan.asm
start.o: start.asm
main.o: main.c

write.o: write.asm
puts.o: puts.c

clean:
	rm *.o ahalan puts
