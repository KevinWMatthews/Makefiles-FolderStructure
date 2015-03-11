extern "C"
{
  // #includes with C linkage
  #include "module.h"
}

// #include with C++ linkage
#include "CppUTest/TestHarness.h"
#include "moduleTest.h"

TEST_GROUP(moduleTest)
{
  void setup()
  {
  }
  void teardown()
  {
  }
};

TEST(moduleTest, DummyFunc)
{
  LONGS_EQUAL(7, module_DummyFunc(7));
}
