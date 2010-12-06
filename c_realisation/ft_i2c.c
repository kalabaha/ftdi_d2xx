#include "ft_i2c.h"

void ft_i2c_init(FT_I2C_Struct * fti2c, FT_Struct *ft, unsigned char scl, unsigned char sda, unsigned char sda_read)
{
    fti2c->ft = ft;
    fti2c->scl = (1 << scl);
    fti2c->sda = (1 << sda);
    fti2c->sda_read = sda_read;
}

void ft_i2c_put_start(FT_I2C_Struct * fti2c)
{
    ft_hight_push(fti2c->ft, fti2c->sda | fti2c->scl);
    ft_hight_push(fti2c->ft, fti2c->scl);
    ft_hight_push(fti2c->ft, 0);
}

void ft_i2c_put_stop(FT_I2C_Struct * fti2c)
{
    ft_hight_push(fti2c->ft, 0);
    ft_hight_push(fti2c->ft, fti2c->scl);
    ft_hight_push(fti2c->ft, fti2c->scl);
    ft_hight_push(fti2c->ft, fti2c->sda | fti2c->scl);
}

void ft_i2c_put_byte(FT_I2C_Struct * fti2c, unsigned char data)
{
    unsigned char i;
    for(i=0; i<8; i++)
    {
        unsigned char current_bit;
        current_bit = (data & (128 >> i)) ? fti2c->sda : 0;
        ft_hight_push(fti2c->ft, current_bit);
        ft_hight_push(fti2c->ft, current_bit | fti2c->scl);
        ft_hight_push(fti2c->ft, current_bit);
    }
    ft_hight_push(fti2c->ft, fti2c->sda);
    ft_hight_push(fti2c->ft, fti2c->scl | fti2c->sda);
    ft_hight_push(fti2c->ft, fti2c->sda);
}

