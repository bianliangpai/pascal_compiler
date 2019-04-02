#include <gtest/gtest.h>
#include "pc_string.h"

TEST(StrReplace, single_l) {
  std::string s("|[substr2]");
  std::string delimiter("|");
  std::vector<std::string> result;
  SplitBy(s, delimiter, result);

  EXPECT_EQ(result.size(), 1);
}

TEST(StrReplace, single_m) {
  std::string s("[substr1]|[substr2]");
  std::string delimiter("|");
  std::vector<std::string> result;
  SplitBy(s, delimiter, result);

  EXPECT_EQ(result.size(), 2);
}

TEST(StrReplace, single_r) {
  std::string s("[substr1]|");
  std::string delimiter("|");
  std::vector<std::string> result;
  SplitBy(s, delimiter, result);

  EXPECT_EQ(result.size(), 1);
}

TEST(StrReplace, double_l_m) {
  std::string s("|[substr1]|[substr2]");
  std::string delimiter("|");
  std::vector<std::string> result;
  SplitBy(s, delimiter, result);

  EXPECT_EQ(result.size(), 2);
}

TEST(StrReplace, double_m_m) {
  std::string s("[substr0]|[substr1]|[substr2]");
  std::string delimiter("|");
  std::vector<std::string> result;
  SplitBy(s, delimiter, result);

  EXPECT_EQ(result.size(), 3);
}

TEST(StrReplace, double_r_m) {
  std::string s("[substr0]|[substr1]|");
  std::string delimiter("|");
  std::vector<std::string> result;
  SplitBy(s, delimiter, result);

  EXPECT_EQ(result.size(), 2);
}

TEST(StrReplace, triple_l_m_r) {
  std::string s("|[substr0]|[substr1]|");
  std::string delimiter("|");
  std::vector<std::string> result;
  SplitBy(s, delimiter, result);

  EXPECT_EQ(result.size(), 2);
}

int main(int argc, char* argv[]) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}