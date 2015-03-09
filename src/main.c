#include <stdio.h>
#include "module.h"
#include "SampleMath.h"
#include "SampleMathExt.h"

int main(int argc, char * argv[])
{
  int ret;

  printf("Hello Makefile project!\n");
  printf("You're in main()\n");

  ret = module_DummyFunc(7);
  printf("Calling module_DummyFunc(): %d\n", ret);

  ret = SampleMath_Multiply(7, 4);
  printf("Calling SampleMath_Add(): %d\n", ret);

  ret = SampleMathExt_Power(3, 4);
  printf("Calling SampleMathExt_Power(): %d\n", ret);

  return 0;
}
