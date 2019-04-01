CC=g++

CXX_RELEASE_FLAGS=-O3 -fpermissive -fPIC -std=c++11
CXX_DEBUG_FLAGS=-g -O0 -fpermissive -fPIC -DDEBUG -std=c++11
CXX_TEST_FLAGS=$(CXX_DEBUG_FLAGS)

SRCS_DIR=src
SRCS=$(wildcard $(SRCS_DIR)/*.cpp)
TEST_SRCS_DIR=test
TEST_SRCS=$(wildcard $(TEST_SRCS_DIR)/*.cpp)

LIBRARY_DIR=
TEST_LIBRARY_DIR=-L/usr/lib/x86_64-linux-gnu

LIBRARIES=
TEST_LIBRARIES=-lpthread -lgtest

TARGET_DIR=out

RELEASE_TARGET=pascal_compiler
DEBUG_TARGET=debug
TEST_TARGET=unittest

all: $(RELEASE_TARGET) $(DEBUG_TARGET) $(TEST_TARGET)

$(RELEASE_TARGET): $(SRCS)
	$(CC) $(CXX_RELEASE_FLAGS) $(LIBRARY_DIR)      $(LIBRARIES)      $(SRCS)      -o $(TARGET_DIR)/$(TARGET)

$(DEBUG_TARGET): $(SRCS)
	$(CC) $(CXX_DEBUG_FLAGS)   $(LIBRARY_DIR)      $(LIBRARIES)      $(SRCS)      -o $(TARGET_DIR)/$(DEBUG_TARGET)

$(TEST_TARGET): $(TEST_SRCS)
	$(CC) $(CXX_TEST_FLAGS)    $(TEST_LIBRARY_DIR) $(TEST_LIBRARIES) $(TEST_SRCS) -o $(TARGET_DIR)/$(TEST_TARGET)


clean:
	if [ -d "out" ];   then rm -r out;   fi;
	if [ -d "build" ]; then rm -r build; fi;