all: copy MINILIBMX little_clean


copy:
	mkdir obj
	cp inc/*.h obj/
	cp src/*.c obj/

MINILIBMX: object.o

object.o:
	clang -std=c11 -Wall -Wextra -Werror -Wpedantic -o part_of_the_matrix obj/*.c

little_clean:
	rm -rf obj

uninstall:
	rm -rf obj
	rm part_of_the_matrix

clean:
	rm -rf src
	rm -rf inc
	rm -rf obj

reinstall:
	make uninstall
	make

test:
	./part_of_the_matrix | cat -e
	./part_of_the_matrix "xxx" "+" "?0?" "1?0" | cat -e
	./part_of_the_matrix "???" "??" "XXX" "1?0" | cat -e
	./part_of_the_matrix "?" "?" "1" "8" | cat -e
	./part_of_the_matrix "-3" "+" "-?4" "-2?" | cat -e
	./part_of_the_matrix "  ??  " "  /  " "  11  " "  1  " | cat -e
	./part_of_the_matrix "69" "/" "0" "?" | cat -e
	./part_of_the_matrix "?" "*" "11" "??" | cat -e