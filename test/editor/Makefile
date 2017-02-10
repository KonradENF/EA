EDITOR_TEST_DIR = $(DIR)/test/editor


SOURCES = $(wildcard $(EDITOR_TEST_DIR)/*.cpp)	

#SOURCES = C:/Users/kfahrendholz/Documents/GitHub/EA/test/editor/testgtest.cpp
OBJDIR		:= $(EDITOR_TEST_DIR)/obj
BINDIR		:= $(EDITOR_TEST_DIR)/bin

EXECUTABLE = $(EDITOR_TEST_DIR)/Test


#OBJECTS = $(SOURCES:%.cpp=%/obj.o)

OBJECTS  := $(SOURCES:$(EDITOR_TEST_DIR)/%.cpp=$(OBJDIR)/%.o)

$(OBJECTS): $(OBJDIR)/%.o : $(EDITOR_TEST_DIR)/%.cpp
	$(CXX) $(CXX_FLAGS) -o $@ -c $<
	
#$(OBJDIR)%.o: %.cpp
#	$(CXX) $(CXX_FLAGS) -o $@ -c $<

editor_test: $(EXECUTABLE) 
	

$(EXECUTABLE): $(OBJECTS) 
	$(CXX) $(CXX_FLAGS) $(LDFLAGS)  $(WXWIDGETS_LIBS) -lpthread   $^ -o $@ $(GTEST_LIBS)

unittestparameter =--gtest_output=xml:test/result/Editor.xml
unittest: editor_test 
	--$(EXECUTABLE).exe $(unittestparameter)
	
	
#.PHONY : install
#.SILENT : install
install :
	if not exist "./bin" mkdir "./bin"
	if not exist "./obj" mkdir "./obj"
	

#$(CC) -o $@ $(OBJECTS) $(LDFLAGS) 	
	

#${OBJDIR}%.o: %.cpp
#	$(CC) $(CFLAGS) -o $@ -c $<
#	
#
#
#TESTS = sample1_unittest
#
#
#All : $(TESTS)
#
#sample1_unittest.o : $(USER_DIR)/testgtest.cpp                    
#	$(CXX) $(CXXFLAGS) -c $(USER_DIR)/testgtest.cpp -o $@
#
#sample1_unittest : sample1_unittest.o 
#	$(CXX) $(CXXFLAGS) $(LDFLAGS)  $(WxWidgets_LIBS) -lpthread   $^ -o $@ $(GTEST_LIBS)