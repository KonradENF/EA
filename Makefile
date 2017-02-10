DIR = .
EXT_DIR = $(DIR)/ext

WXWIDGETS_DIR = $(EXT_DIR)/wxwidgets
WXWIDGETS_INCLUDE = $(WXWIDGETS_DIR)/include
WXWIDGETS_INCLUDE_MSW = $(WXWIDGETS_DIR)/lib
WXWIDGETS_LIB = $(WXWIDGETS_DIR)/lib
WXWIDGETS_LIBS = -L$(WXWIDGETS_LIB) -mthreads  -lwxmsw31u -mwindows

GTEST_DIR = $(EXT_DIR)/google/gtest
GTEST_INCLUDE = $(GTEST_DIR)/include
GTEST_HEADERS = $(GTEST_INCLUDE)/gtest/*.h \
                $(GTEST_INCLUDE)/gtest/internal/*.h
GTEST_LIB = $(GTEST_DIR)/lib
GTEST_LIBS = -L$(GTEST_LIB) -lgtest -lgtest_main

CXX = mingw32-g++

CXX_FLAGS = -pipe -DWINVER=0x0500 -mthreads -D__GNUWIN32__ -D__WXMSW__ -DWXUSINGDLL -DwxUSE_UNICODE -Wall -g -std=gnu++11
CXX_FLAGS += -I$(WXWIDGETS_INCLUDE)  -I$(WXWIDGETS_INCLUDE_MSW) 
CXX_FLAGS += -I$(GTEST_INCLUDE) 
#CXX_FLAGS += -isystem$(GTEST_INCLUDE) 

#-I $(WxWidgets_INCLUDE_PATH_MSW)

LDFLAGS = -mthreads  -lwxmsw31u -mwindows -mconsole



include $(DIR)/test/editor/Makefile

test: editor_test




