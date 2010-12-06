OS = $(shell uname -s)
ifeq  ($(OS), Linux)
	CC = g++
	LIBS = -lftd2xx -L/opt/lib64/ -Wl,-rpath,/opt/lib64/
	RM = rm -f
	APP = ft_i2c_eeprom
else
	CC = g++ -static
	LIBS = "../ft_libs_win/FTD2XX.lib"
	CC = g++ -enable-auto-import -static
	LINK = g++ -static
	RM = del
	APP = ft_i2c_eeprom.exe
endif

SOURCES = ../ft_hight/fthight.cpp ../ft_i2c/ft_i2c.cpp ft_i2c_eeprom.cpp tst.cpp

all: $(APP)

clean:
	rm -f $(APP) *.o

$(APP): $(SOURCES:.c=.o)
	$(LINK.o) $^ $(LIBS) -o $@
