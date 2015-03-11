extern "C"
{
  // #includes with C linkage
}

// #include with C++ linkage
#include "CppUTest/TestHarness.h"

TEST_GROUP(moduleTest)
{
  void setup()
  {
  }
  void teardown()
  {
  }
};

TEST(moduleTest, Wiring)
{
  FAIL("moduleTest wired properly!");
}
