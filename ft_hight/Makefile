OS = $(shell uname -s)
ifeq  ($(OS), Linux)
	CC = g++
	LIBS = -lftd2xx -L/opt/lib64/ -Wl,-rpath,/opt/lib64/
	RM = rm -f
	APP = ft_i2c
else
	CC = g++ -static
	LIBS = "../ft_libs_win/FTD2XX.lib"
	LINK = g++ -static
	RM = del
	APP = ft_i2c.exe
endif

SOURCES = fthight.cpp tst.cpp

all: $(APP)

clean:
	$(RM) $(APP) 

$(APP): $(SOURCES:.cpp=.o)
	$(LINK.o) $^ $(LIBS) -o $@
