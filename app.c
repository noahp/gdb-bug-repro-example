#include <stdio.h>

extern void *__real_malloc(size_t size);

void *__wrap_malloc(size_t size) {
  void *ptr = __real_malloc(size);
  return ptr;
}

int main() {
  printf("hello!\n");
  return 0;
}
