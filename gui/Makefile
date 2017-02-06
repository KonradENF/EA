WxWidgets 					= ..\\ext\\wxWidgets\\
WxWidgetsInclude 			= $(WxWidgets)include
WxWidgetsLibGccDLL 				= $(WxWidgets)lib\\gcc_dll
WxWidgetsLibGccDLLCustomName 	= wxmsw30u_gcc_custom.dll
WxWidgetsLibGccDLLCustom 	= $(WxWidgetsLibGccDLL)\$(WxWidgetsLibGccDLLCustomName)
WxWidgetsLibGccDLLMSWU 		= $(WxWidgetsLibGccDLL)\mswu

CC				=	mingw32-g++
CFLAGS			=	-pipe -mthreads -D__GNUWIN32__ -D__WXMSW__ -DWXUSINGDLL -DwxUSE_UNICODE -Wall -g -std=c++11 -I$(WxWidgetsInclude) -I$(WxWidgetsLibGccDLLMSWU) -c 
LDFLAGS			=	-L$(WxWidgetsLibGccDLL) -mthreads  -lwxmsw30u -mwindows


SOURCES = $(wildcard *.cpp)

#csrc = $(wildcard src/*.c) \
#       $(wildcard src/engine/*.c) \
#       $(wildcard src/audio/*.c)

OBJDIR		:= ./obj
BINDIR		:= ./bin

OBJECTS = $(SOURCES:%.cpp=$(OBJDIR)%.o)

EXECUTABLE		=	$(BINDIR)/Application.exe

RM				=	del /S
RMD				=	rd 

all: install introallstart $(SOURCES) $(EXECUTABLE) introallend 	


$(EXECUTABLE): $(OBJECTS) 
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS) 

${OBJDIR}%.o: %.cpp
	$(CC) $(CFLAGS) -o $@ -c $<
	
allclean: clean all

.PHONY : introallstart
.SILENT : introallstart

introallstart: 
	@echo  Start building gui...	
	
.PHONY : introallend
introallend: 
	@echo  ...End building gui

.PHONY : install
.SILENT : install

install :
	if not exist "./bin" mkdir bin
	if not exist "./obj" mkdir obj
	copy "$(WxWidgetsLibGccDLLCustom)" "$(BINDIR)/$(WxWidgetsLibGccDLLCustomName)" >NUL
	
.PHONY : clean
.SILENT : clean
clean:
	@echo Execute clean
	$(RM) *.o >NUL
	$(RM) *.exe >NUL
	$(RM) *.dll >NUL
	if exist "$(BINDIR)" $(RMD) "$(BINDIR)" >NUL
	if exist "$(OBJDIR)" $(RMD) "$(OBJDIR)" >NUL
	@echo End clean
