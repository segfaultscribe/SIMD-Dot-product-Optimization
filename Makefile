CC = gcc
CFLAGS = -Wall -Wextra -pedantic

SRC = src/dot_naive.c
OUT = dn

$(OUT): $(SRC)
	gcc -O3 -S -march=native src/dot_naive.c -o dot_naive.s

.PHONY: clean

clean:
	rm -f $(OUT)
