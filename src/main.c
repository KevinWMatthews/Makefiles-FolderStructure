#include <stdio.h>
#include "module.h"
#include "SampleMath.h"

int main(int argc, char * argv[])
{
  int ret;

  printf("Hello Makefile project!\n");
  printf("You're in main()\n");

  ret = module_DummyFunc(7);
  printf("Calling module_DummyFunc(): %d\n", ret);

  ret = SampleMath_Multiply(7, 4);
  printf("Calling SampleMath_Add(): %d\n", ret);

  return 0;
}
