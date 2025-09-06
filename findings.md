# Results and Inference

## Initial dry run : BASELINE

**gcc -O0** <br> 
Naive scalar: `0.003025 sec`

**gcc -O3 -march=native -fopt-info** <br>
src/dot_naive.c:11:21: optimized: loop vectorized using 32 byte vectors 
src/dot_naive.c:11:21: optimized: loop vectorized using 16 byte vectors 

Naive scalar: `0.000658 sec`

> 4.5x speedup on intial run. BASELINE 