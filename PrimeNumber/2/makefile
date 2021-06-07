2: main.o checkPrimeNumber.o
	gcc -o 2 main.o checkPrimeNumber.o

main.o: main.s
	gcc -c -g main.s

checkPrimeNumber.o: checkPrimeNumber.c
	gcc -c -g checkPrimeNumber.c

clean:
	rm*.o