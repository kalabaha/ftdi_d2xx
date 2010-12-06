#ifndef c_fti2ceeprom_h
#define c_fti2ceeprom_h

#include "ft_i2c.h"

void ft_i2c_eeprom_write_byte(
        FT_I2C_Struct * fti2c, 
        unsigned char dev_address, 
        unsigned int address, 
        unsigned char data);

unsigned char  ft_i2c_eeprom_read_byte(
        FT_I2C_Struct * fti2c,
        unsigned char dev_address,
        unsigned int address);

#endif 
