#ifndef __PC_LOG_H__
#define __PC_LOG_H__

#include <cstdio>

#ifdef DEBUG
  #ifndef PC_LOGI
  #define PC_LOGI(msg, ...)                                              \
    do {                                                                 \
      char buf[52];                                                      \
      sprintf(buf, msg);                                                 \
      printf("[Info][File: %s, Line: %d] %s\n", __FILE__, __LINE__, buf); \
    } while(0);
  #endif //PC_LOGI
#else //DEBUG
  #define PC_LOGI(msg, ...)
#endif //DEBUG

#endif //__PC_LOG_H__