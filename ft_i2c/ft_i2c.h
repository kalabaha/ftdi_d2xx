#ifndef ft_i2c_h
#define ft_i2c_h

#include "../ft_hight/fthight.h"

class FT_I2C
{
    FTHight * ft;
    unsigned char scl;
    unsigned char sda;
    unsigned char sda_read;
    unsigned char * input_data;
public:
    FT_I2C(unsigned int size, unsigned char SDA, unsigned char SCL, unsigned char SDAREAD);
    void put_start();
    void put_stop();
    void put_byte(unsigned char data);
    void send();
    void send_read(unsigned char * input_data, unsigned int * recived); 
    void print(bool is_hex);
    void clear();
};

#endif
