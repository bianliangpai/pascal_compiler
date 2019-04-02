CC=g++

CXX_RELEASE_FLAGS=-O3 -fpermissive -fPIC -std=c++11
CXX_DEBUG_FLAGS=-g -O0 -fpermissive -fPIC -DDEBUG -std=c++11
CXX_TEST_FLAGS=$(CXX_DEBUG_FLAGS)

SRCS_DIR=src
SRCS=$(wildcard $(SRCS_DIR)/*.cpp)
TEST_SRCS_DIR=test
TEST_SRCS=$(filter-out src/main.cpp, $(SRCS)) $(wildcard $(TEST_SRCS_DIR)/*.cpp)

INC_DIR=-Iinc

LIBRARY_DIR=
TEST_LIBRARY_DIR=

LIBRARIES=
TEST_LIBRARIES=-lgtest -lpthread

TARGET_DIR=out

RELEASE_TARGET=pascal_compiler
DEBUG_TARGET=debug
TEST_TARGET=unittest

all: $(RELEASE_TARGET) $(DEBUG_TARGET) $(TEST_TARGET)

$(RELEASE_TARGET): $(SRCS)
	mkdir -p out
	$(CC) $(SRCS)      $(INC_DIR) $(CXX_RELEASE_FLAGS) $(LIBRARY_DIR)      $(LIBRARIES)      -o $(TARGET_DIR)/$(RELEASE_TARGET)

$(DEBUG_TARGET): $(SRCS)
	mkdir -p out
	$(CC) $(SRCS)      $(INC_DIR) $(CXX_DEBUG_FLAGS)   $(LIBRARY_DIR)      $(LIBRARIES)      -o $(TARGET_DIR)/$(DEBUG_TARGET)

$(TEST_TARGET): $(TEST_SRCS)
	mkdir -p out
	$(CC) $(TEST_SRCS) $(INC_DIR) $(CXX_TEST_FLAGS)    $(TEST_LIBRARY_DIR) $(TEST_LIBRARIES) -o $(TARGET_DIR)/$(TEST_TARGET)


clean:
	if [ -d "out" ]; then rm -r out; fi;