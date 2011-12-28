all: runprog

runprog: runprog.o
	gcc runprog.c  -o runprog

runprog.o: runprog.c
	gcc -c runprog.c

clean:
	rm *.o