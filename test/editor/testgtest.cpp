#ifndef EN_TEST_EDITOR_TESTGTEST_HPP
#define EN_TEST_EDITOR_TESTGTEST_HPP

#include <gtest/gtest.h>
#include <iostream>
#include <wx/volume.h>


TEST(EditorTest, FirstTest) {
EXPECT_EQ(1, 2);
}

TEST(EditorTest, Secound) {
EXPECT_EQ(1, 1);
}


int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}





#endif // EN_TEST_EDITOR_TESTGTEST_HPP
