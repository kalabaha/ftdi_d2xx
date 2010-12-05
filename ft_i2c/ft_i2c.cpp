#include "ft_i2c.h"


FT_I2C::FT_I2C(unsigned int size, unsigned char SDA, unsigned char SCL)
{
    this->ft = new FTHight(255);
    this->SCL = SCL;
    this->SDA = SDA;
}

void FT_I2C::put_start()
{
    *ft << (SDA | SCL) << SCL << 0;
}

void FT_I2C::put_stop()
{
    *ft << 0 << SCL << SCL << (SDA | SCL);
}

void FT_I2C::put_byte(unsigned char data)
{
    int i;
    for(i=0; i<8; i++)
    {
        unsigned char current_bit;

        if (data & (128 >> i))
            current_bit = SDA;
        else 
            current_bit = 0;

        *ft << current_bit;
        *ft << (current_bit | SCL);
        *ft << current_bit;
    }

    *ft << SDA;
    *ft << (SDA | SCL);
    *ft << SDA;
}

void FT_I2C::send(bool is_hex)
{
    ft->print(is_hex);
}

void FT_I2C::clear()
{
    ft->clear();
}
