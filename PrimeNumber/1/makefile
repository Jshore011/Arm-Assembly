1: main.o checkPrimeNumber.o 
	gcc -o 1 main.o checkPrimeNumber.o 

main.o: main.c
	gcc -c -g main.c

checkPrimeNumber.o: checkPrimeNumber.s
	gcc -c -g checkPrimeNumber.s


clean:
	rm*.o
