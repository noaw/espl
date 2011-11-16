all: bcmp bfix testdiff

bcmp: bcmp.o
	gcc bcmp.c  -o bcmp

bcmp.o: bcmp.c
	gcc -c bcmp.c

bfix: bfix.o
	gcc bfix.c -o bfix

bfix.o:	bfix.c
	gcc - bfix.c

testdiff: testdiff.o diff.o

testdiff.o: testdiff.c diff.h
diff.o: diff.c diff.h

clean:
	rm *.o