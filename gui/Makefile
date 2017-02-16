GUI_DIR = $(DIR)/gui



SOURCES = $(wildcard $(GUI_DIR)/*.cpp)	

#SOURCES = C:/Users/kfahrendholz/Documents/GitHub/EA/test/editor/testgtest.cpp
OBJDIR		:= $(GUI_DIR)/obj
BINDIR		:= $(GUI_DIR)/bin

EXECUTABLE = $(GUI_DIR)/gui.exe


#OBJECTS = $(SOURCES:%.cpp=%/obj.o)

OBJECTS  := $(SOURCES:$(GUI_DIR)/%.cpp=$(OBJDIR)/%.o)

$(OBJECTS): $(OBJDIR)/%.o : $(GUI_DIR)/%.cpp
	$(CXX) $(CXX_FLAGS) -o $@ -c $<
	
#$(OBJDIR)%.o: %.cpp
#	$(CXX) $(CXX_FLAGS) -o $@ -c $<


#LDFLAGS := $(WXWIDGETS_LIBS) -lpthread $(GTEST_LIBS)
LDFLAGS =  -mwindows $(WXWIDGETS_LIBS) 

gui_gui: $(EXECUTABLE) 
	

$(EXECUTABLE): $(OBJECTS) 
	$(CXX) $^ -o $@ $(LDFLAGS)
	
#$(GTEST_LIBS)


#.PHONY : install
#.SILENT : install
install :
	if not exist "./bin" mkdir "./bin"
	if not exist "./obj" mkdir "./obj"
