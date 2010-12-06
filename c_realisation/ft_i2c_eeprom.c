#include "ft_i2c_eeprom.h"

typedef union 
{
    struct
    {
        unsigned char lo_byte;
        unsigned char hi_byte;
    };
    unsigned int int_data;
} IntByte;

unsigned char extractByte(
        unsigned char * data, 
        unsigned int offset, 
        unsigned char sda_read)
{
    unsigned char dataByte = 0;
    unsigned char i;
    for (i=0; i<8; i++)
        dataByte |= ((128 >> i) * ((data[i*3+offset] & (1<<sda_read))>>sda_read));

    return dataByte;
}

void ft_i2c_eeprom_write_byte(
        FT_I2C_Struct * fti2c, 
        unsigned char dev_address, 
        unsigned int address, 
        unsigned char data)
{
    IntByte addr;
    addr.int_data = address;

    ft_i2c_put_start(fti2c);
    ft_i2c_put_byte(fti2c, dev_address);
    ft_i2c_put_byte(fti2c, addr.hi_byte);
    ft_i2c_put_byte(fti2c, addr.lo_byte);
    ft_i2c_put_byte(fti2c, data);
    ft_i2c_put_stop(fti2c);
    ft_i2c_put_byte(fti2c, 0xff);

    ft_hight_send(fti2c->ft);
}

unsigned char  ft_i2c_eeprom_read_byte(
        FT_I2C_Struct * fti2c,
        unsigned char dev_address,
        unsigned int address)
{
    IntByte addr;
    addr.int_data = address;

    ft_i2c_put_start(fti2c);
    ft_i2c_put_byte(fti2c, dev_address);
    ft_i2c_put_byte(fti2c, addr.hi_byte);
    ft_i2c_put_byte(fti2c, addr.lo_byte);
    ft_i2c_put_start(fti2c);
    ft_i2c_put_byte(fti2c, dev_address + 1);
    ft_i2c_put_byte(fti2c, 0xff);

    ft_hight_send_read(fti2c->ft);
    unsigned char res;
    res = extractByte(fti2c->ft->data, 116, fti2c->sda_read);
    return res;
}

