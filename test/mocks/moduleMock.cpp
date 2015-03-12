// Can't do regular testing on a module and mock it too!
// :)

// extern "C"
// {
//   #include "module.h"
// }

// #include "CppUTest/TestHarness.h"
// #include "CppUTestExt/MockSupport.h"

// TEST_GROUP(moduleMock)
// {
//   void setup()
//   {
//     mock().clear();
//   }

//   void teardown()
//   {
//     mock().clear();
//   }
// };

// // Mock the production code from module.c
// int module_DummyFunc(int arg)
// {
//   mock().actualCall("module_DummyFunc")
//         .withParameter("p1", arg);

//   // Looks like we set the return value when the mock call is created
//   return mock().intReturnValue();
// }

// TEST(moduleMock, BasicDummyFuncCall)
// {
//   int ret = 0;
//   mock().expectOneCall("module_DummyFunc")
//         .withParameter("p1", 7)
//         .andReturnValue(7);

//   ret = module_DummyFunc(7);
//   mock().checkExpectations();
//   LONGS_EQUAL(7, ret);
// }
