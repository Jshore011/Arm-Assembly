3: main.o checkPrimeNumber.o
	gcc -o 3 main.o checkPrimeNumber.o

main.o: main.s
	gcc -c -g main.s

checkPrimeNumber.o: checkPrimeNumber.s
	gcc -c -g checkPrimeNumber.s

clean:
	rm*.o

	
