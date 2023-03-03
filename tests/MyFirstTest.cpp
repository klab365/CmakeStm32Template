#include <gtest/gtest.h>
#include "App.h"

TEST(MyFirstTestClass, ThisTestPasses)
{
  SUCCEED();
}

TEST(MyFirstTestClass, Calculate_Should_Be_Successful)
{
  int a = 10;
  int b = 10;

  int result = calculate(a, b);

  ASSERT_EQ(result, 20);
}

int main(int argc, char **argv)
{
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}