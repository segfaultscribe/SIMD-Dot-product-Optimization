#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define NUM_REPEATS 10000000
float a[NUM_REPEATS];
float b[NUM_REPEATS];

float dot_naive(const float* a, const float* b, size_t n){
    float result = 0.0f;
    for(size_t i=0;i<n;i++){
        result += a[i] * b[i];
    }
    return result;
}

double benchmark(
    const char *name,
    float (*dot_naive)(const float*,const float*, size_t),
    const float *a,
    const float *b,
    size_t n
){
    struct timespec start, end;
    double best = 1e9;

    for(int i=0;i<5;++i){
        clock_gettime(CLOCK_MONOTONIC, &start);
        volatile float result = dot_naive(a, b, n);
        clock_gettime(CLOCK_MONOTONIC, &end);

        double elapsed = (end.tv_sec - start.tv_sec) +
                        (end.tv_nsec - start.tv_nsec) / 1e9;

        if (elapsed < best) best = elapsed;
    }

    printf("%s: %.6f sec\n", name, best);
    return best;
}

void allocate_aligned(float** a, float** b, size_t n){

    //aligned in memory to improve load speed
    if (posix_memalign((void**)a, 32, n * sizeof(float)) != 0) {
        perror("posix_memalign a failed");
        exit(1);
    }

    if (posix_memalign((void**)b, 32, n * sizeof(float)) != 0) {
        perror("posix_memalign b failed");
        free(*a);
        exit(1);
    }

    // fill up the arrays with random values
    for (size_t i = 0; i < n; i++) {
        (*a)[i] = (rand() % 1000) / 100.0f;
        (*b)[i] = (rand() % 1000) / 100.0f;
    }
}

int main(){
    size_t n = 1 << 20;

    float *a, *b;
    allocate_aligned(&a, &b, n);

    benchmark("Naive scalar", dot_naive, a, b, n);

    free(a);
    free(b);
    return 0;
}