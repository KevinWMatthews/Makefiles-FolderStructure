#include <stdio.h>
#include "module.h"

int main(int argc, char * argv[])
{
  int ret;

  printf("Hello Makefile project!\n");
  printf("You're in main()\n");

  ret = module_DummyFunc(7);
  printf("Calling module_DummyFunc(): %d", ret);

  return 0;
}
