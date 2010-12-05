APP = ft_i2c
CC = g++ 

OS = $(shell uname -s)
ifeq  ($(OS), Linux)
	CC = g++
	LIBS = -lftd2xx -L/opt/lib64/ -Wl,-rpath,/opt/lib64/
else
	LIBS = "../ft_libs_win/FTD2XX.lib"
	LINK = g++ -static
endif


SOURCES = ../ft_hight/fthight.cpp ft_i2c.cpp tst.cpp

all: $(APP)

clean:
	rm -f $(APP) *.o

$(APP): $(SOURCES:.c=.o)
	$(LINK.o) $^ $(LIBS) -o $@
