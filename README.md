# SIMD Dot Product Optimization: A Performance Case Study (SSE, AVX, AVX2) 

This project explores CPU-level optimizations for the dot product, a fundamental operation in machine learning and numerical computing. Starting from a naive scalar implementation, we analyze compiler auto-vectorization and progressively implement SIMD versions using SSE, AVX, and AVX2. The goal is to understand instruction-level parallelism, memory alignment, cache effects, and their impact on performance.

NOTE: This is a project aimed at **learning** and exploring SIMD assembly and serves as an intro to optimizations. Maybe this project might approach a dead end, without credible results. But that does not take away the amount of learning and experience this brings. Do it for the journey! 
### Updates on experiment

Currently updates on this projects can be found in the [findings](./findings.md) file. Until there is relavant progress this file will contain the experiments and results.
### Intended experiment structure

- [x]  Naive scalar baseline
- [x] Compiler auto-vectorized result
- [ ] SSE implementation  | 128 bit
- [ ] AVX implementation  | 256 bit
- [ ] AVX2 implementation | 256 bit
- [ ] Benchmarking & profiling (perf, valgrind)
- [ ] Results + visualization
- [ ] Writeups and fully updated README.
