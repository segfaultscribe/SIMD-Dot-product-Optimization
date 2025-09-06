CC = gcc
CFLAGS = -Wall -Wextra -pedantic

SRC = src/dot_naive.c
OUT = dn

$(OUT): $(SRC)
	gcc -O3 -march=native -fopt-info-vec src/dot_naive.c -o dotn_vec

.PHONY: clean

clean:
	rm -f $(OUT)
