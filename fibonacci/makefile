fibonacci: main.o get_input.o fibonacci_loop.o
	gcc -o fibonacci main.o get_input.o fibonacci_loop.o

main.o: main.s
	gcc -c -g main.s

get_input.o: get_input.s
	gcc -c -g get_input.s

fibonacci_loop.o: fibonacci_loop.s
	gcc -c -g fibonacci_loop.s

clean:
	rm*.o