all: bcmp bfix testdiff dir

bcmp: bcmp.o
	gcc bcmp.c  -o bcmp

bcmp.o: bcmp.c
	gcc -c bcmp.c

bfix: bfix.o diff.o
	gcc bfix.c diff.c -o bfix

bfix.o:	bfix.c
	gcc -c bfix.c

diff.o: diff.c
	gcc -c diff.c

testdiff: testdiff.o diff.o

testdiff.o: testdiff.c diff.h
diff.o: diff.c diff.h

dir: dir.o
	gcc dir.c  -o dir

dir.o: dir.c
	gcc -c dir.c


clean:
	rm *.o