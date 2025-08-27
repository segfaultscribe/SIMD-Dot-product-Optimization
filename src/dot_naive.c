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

void allocate_aligned(){
    float *a, *b;
    size_t n = 1 << 20;

    //aligned in memory to improve load speed
    if (posix_memalign((void**)&a, 32, n * sizeof(float)) != 0) {
        perror("posix_memalign a failed");
        return 1;
    }

    if (posix_memalign((void**)&b, 32, n * sizeof(float)) != 0) {
        perror("posix_memalign b failed");
        free(a);
        return 1;
    }

    // fill up the arrays with random values
    for (size_t i = 0; i < n; i++) {
        a[i] = (rand() % 1000) / 100.0f;
        b[i] = (rand() % 1000) / 100.0f;
    }

    free(a);
    free(b);
}

int main(){
    struct timespec start, end;
    double elapsed;

    float init_a[10] = {1,2,3,4,5,6,7,8,9,10};
    float init_b[10] = {11,12,13,14,15,16,17,18,19,20};

    for (size_t i = 0; i < NUM_REPEATS; i++) {
        a[i] = init_a[i % 10];
        b[i] = init_b[i % 10];
    }

    float out = 0.0f;

    clock_gettime(CLOCK_MONOTONIC, &start);

     for (int i = 0; i < NUM_REPEATS; i++) {
        out = dot_naive(a, b, 10);
    }

    clock_gettime(CLOCK_MONOTONIC, &end);
    elapsed = (end.tv_sec - start.tv_sec) +
              (end.tv_nsec - start.tv_nsec) / 1e9;

    printf("The dot product of a and b using naive caluculation is: %.2f\n", out);
    printf("Elapsed time: %.6f seconds\n", elapsed);
    return 0;
}