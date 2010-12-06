#ifndef c_fti2c_h
#define c_fti2c_h

#include "ft_hight.h"

typedef struct _FT_I2C_Struct
{
    FT_Struct * ft;
    unsigned char scl;
    unsigned char sda;
    unsigned char sda_read;
} FT_I2C_Struct;


void ft_i2c_init(
        FT_I2C_Struct * fti2c, 
        FT_Struct *ft,
        unsigned char scl,
        unsigned char sda, 
        unsigned char sda_read);

void ft_i2c_put_start(FT_I2C_Struct * fti2c);

void ft_i2c_put_stop(FT_I2C_Struct * fti2c);

void ft_i2c_put_byte(FT_I2C_Struct * fti2c, unsigned char data);

#endif
