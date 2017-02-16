EDITOR_DIR = $(DIR)/editor



SOURCES = $(wildcard $(EDITOR_DIR)/*.cpp)	\
			$(wildcard $(EDITOR_DIR)/menu/*.cpp) \
			$(wildcard $(EDITOR_DIR)/view/*.cpp) \
			$(wildcard $(EDITOR_DIR)/view/project/*.cpp) \
			$(wildcard $(EDITOR_DIR)/view/content/*.cpp) \
			$(wildcard $(EDITOR_DIR)/view/console/*.cpp)

#SOURCES = C:/Users/kfahrendholz/Documents/GitHub/EA/test/editor/testgtest.cpp
OBJDIR		:= $(EDITOR_DIR)/obj
BINDIR		:= $(EDITOR_DIR)/bin

EXECUTABLE = $(EDITOR_DIR)/Editor.exe


#OBJECTS = $(SOURCES:%.cpp=%/obj.o)

OBJECTS  := $(SOURCES:$(EDITOR_DIR)/%.cpp=$(OBJDIR)/%.o)

$(OBJECTS): $(OBJDIR)/%.o : $(EDITOR_DIR)/%.cpp
	$(CXX) $(CXX_FLAGS) -o $@ -c $<
	
#$(OBJDIR)%.o: %.cpp
#	$(CXX) $(CXX_FLAGS) -o $@ -c $<

editor_editor: $(EXECUTABLE) 
	

$(EXECUTABLE): $(OBJECTS) 
	$(CXX) $(CXX_FLAGS) $(LDFLAGS)  $(WXWIDGETS_LIBS) -lpthread   $^ -o $@ $(GTEST_LIBS)


#.PHONY : install
#.SILENT : install
install :
	if not exist "./bin" mkdir "./bin"
	if not exist "./obj" mkdir "./obj"
