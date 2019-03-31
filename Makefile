CC=g++

CXX_RELEASE_FLAGS=-O3 -fpermissive -fPIC -std=c++11
CXX_DEBUG_FLAGS=-g -O0 -fpermissive -fPIC -DDEBUG -std=c++11
CXX_TEST_FLAGS=$(CXX_DEBUG_FLAGS)

SRCS_DIR=src
SRCS=$(wildcard $(SRCS_DIR)/*.cpp)
TEST_SRCS_DIR=test
TEST_SRCS=$(wildcard $(TEST_SRCS_DIR)/*.cpp)

TARGET=pascal_compiler
DEBUG_TARGET=debug
TEST_TARGET=test

$(TARGET): $(SRCS)
	$(CC) $(CXX_RELEASE_FLAGS) $(SRCS) -o $(TARGET)

$(DEBUG_TARGET): $(SRCS)
	$(CC) $(CXX_DEBUG_FLAGS) $(SRCS) -o $(DEBUG_TARGET)

$(TEST_TARGET): $(TEST_SRCS)
	$(CC) $(CXX_TEST_FLAGS) $(TEST_SRCS) -o $(TEST_TARGET)


clean:
	rm $(TARGET).exe
	rm $(DEBUG_TARGET).exe
	rm $(TEST_TARGET).exe