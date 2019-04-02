#include "pc_string.h"

void SplitBy(std::string s, const std::string& delimiter, std::vector<std::string>& result) {
  size_t pos = 0;
  std::string token;
  while ((pos = s.find(delimiter)) != std::string::npos) {
      token = s.substr(0, pos);
      result.push_back(token);
      s.erase(0, pos + delimiter.length());
  }
  result.push_back(s);
}