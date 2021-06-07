gcd: main.o gcd_loop.o get_input.o
	gcc -o gcd main.o gcd_loop.o get_input.o

main.o: main.s
	gcc -c -g main.s

gcd_loop.o: gcd_loop.s
	gcc -c -g gcd_loop.s

get_input.o: get_input.s
	gcc -c -g get_input.s

clean:
	rm*.o