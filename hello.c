/* demo_use.c -- demonstrate direct use of the "hello" routine */

#include <stdio.h>
#include "libhello.h"

inline int example(int i) {
  int j = 2;
  return j+i;
}

int main(void) {
  int i = hello(4);
  printf("Hello, library world %u.\n", i);
  i = example(4);
  printf("Hello, library world %u.\n", i);
  return 0;
}
