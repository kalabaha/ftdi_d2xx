OS = $(shell uname -s)
ifeq  ($(OS), Linux)
	CC = gcc
	LIBS = -lftd2xx -L/opt/lib64/ -Wl,-rpath,/opt/lib64/
	RM = rm -f
	APP = ft_eeprom
else
	LIBS = "../ft_libs_win/FTD2XX.lib"
	CC = gcc -enable-auto-import -static
	LINK = gcc -static
	RM = del
	APP = ft_eeprom.exe
endif

SOURCES = ft_hight.c ft_i2c.c ft_i2c_eeprom.c tst.c

all: $(APP)

clean:
	$(RM) $(APP) *.o

$(APP): $(SOURCES:.c=.o)
	$(LINK.o) $^ $(LIBS) -o $@
