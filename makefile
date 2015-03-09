# Set this to @ to keep the makefile quiet
ifndef SILENCE
	SILENCE =
endif

# Y/N
ifndef DEBUG
	DEBUG=N
endif

# Run unit tests
ifndef USE_CPPUTEST
	USE_CPPUTEST = N
endif

### Directory structure and library list ###
TARGET_NAME=FolderStructure
TARGET_DIR=build
TARGET=$(TARGET_DIR)/$(TARGET_NAME)

# Production code
SRC_DIRS=src
INC_DIRS=inc ../Libraries/SampleMath/inc
LIB_DIRS=../Libraries/SampleMath/build
#Static library names without lib prefix and .a suffix
LIB_LIST=SampleMath
OBJ_DIR=obj

# MCU-specific production code
MCU_SRC_DIR=
MCU_INC_DIR=
MCU_LIB_DIRS=
MCU_LIB_LIST=

# CppUTest test harness source code
CPPUTEST_DIR=
CPPUTEST_HOME=
CPPUTEST_INC_DIR=
CPPUTEST_LIB_DIR=
CPPUTEST_LIB_LIST=

# User unit tests
TEST_DIR=test
TEST_SRC_DIRS=$(TEST_DIR)/src $(TEST_DIR)/mocks
TEST_INC_DIR=$(TEST_DIR)/inc
TEST_LIB_DIRS=$(TEST_DIR)/lib
#Static library names without lib prefix and .a suffix
TEST_LIB_LIST=
TEST_TARGET_DIR=$(TEST_DIR)/build
TEST_OBJ_DIR=$(TEST_DIR)/$(OBJ_DIR)

### Compiler tools ###
COMPILER=gcc
LINKER=gcc
ARCHIVER=ar

# Do the real work
include MakefileWorker.make
