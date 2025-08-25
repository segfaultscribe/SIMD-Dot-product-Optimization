# SIMD Dot Product Optimization: A Performance Case Study (SSE, AVX, AVX2) 

This project explores CPU-level optimizations for the dot product, a fundamental operation in machine learning and numerical computing. Starting from a naive scalar implementation, we analyze compiler auto-vectorization and progressively implement SIMD versions using SSE, AVX, and AVX2. The goal is to understand instruction-level parallelism, memory alignment, cache effects, and their impact on performance.

### Intended experiment structure

- [x]  Naive scalar baseline
- [ ] Compiler auto-vectorized implementation
- [ ] SSE implementation  | 128 bit
- [ ] AVX implementation  | 256 bit
- [ ] AVX2 implementation | 256 bit
- [ ] Benchmarking & profiling (perf, valgrind)
- [ ] Results + visualization
- [ ] Writeups and fully updated README.
