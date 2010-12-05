LIBS = "../ft_libs_win/FTD2XX.lib"
CXX = i686-mingw32-g++ -static
LINK = g++

ft_i2c: tst.o fthight.o ft_i2c.o
	$(LINK) -o ft_i2c tst.o fthight.o ft_i2c.o $(LIBS)

ft_i2c_eeprom: tst.o fthight.o ft_i2c.o ft_i2c_eeprom.o
	$(LINK) -o ft_i2c_eeprom tst.o fthight.o ft_i2c.o ft_i2c_eeprom.o $(LIBS)

tst.o: tst.cpp
	$(CXX) -c -o tst.o tst.cpp 

fthight.o: ../ft_hight/fthight.cpp
	$(CXX) -c -o fthight.o ../ft_hight/fthight.cpp

ft_i2c.o: ../ft_i2c/ft_i2c.cpp
	$(CXX) -c -o ft_i2c.o ft_i2c.cpp

ft_i2c_eeprom.o: ft_i2c_eeprom.cpp
	$(CXX) -c -o ft_i2c_eeprom.o ft_i2c_eeprom.cpp

clean:
	del fthight.o tst.o ft_i2c.o

clean_all: clean
	del ft_i2c.exe
