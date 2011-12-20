%.o: %.asm
	nasm -g -f elf -o $@ $<

%.o: %.c
	gcc -m32 -g -nostdlib -fno-stack-protector -c -o $@ $<

.PHONY: all

all: ascart

ascart: start.o ascart.o font.o write.o length.o printSpaceLine.o
	ld -melf_i386 -g -o $@ $^

try: try.o
	ld -melf_i386 -g -o $@ $^

#ascme: ascme.o ascart.o font.o write.o
#	ld -melf_i386 -g -o $@ $^

font.o: font.c font.h
	gcc -m32 -g -nostdlib -fno-stack-protector -c -o $@ $<

ascart.o: ascart.c font.h
	gcc -m32 -g -nostdlib -fno-stack-protector -c -o $@ $<

#ascme.o: ascme.asm font.h
#	nasm -g -f elf -o $@ $<

write.o: write.asm
start.o: start.asm
length.o: length.asm
printSpaceLine.o: printSpaceLine.asm
try.o: try.asm

clean:
	rm *.o ahalan