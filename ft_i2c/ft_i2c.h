#ifndef ft_i2c_h
#define ft_i2c_h

#include "../ft_hight/fthight.h"

class FT_I2C
{
    FTHight * ft;
    unsigned char SCL;
    unsigned char SDA;
public:
    FT_I2C(unsigned int size, unsigned char SDA, unsigned char SCL);
    void put_start();
    void put_stop();
    void put_byte(unsigned char data);
    void send(bool is_hex);
    void clear();
};

#endif
