#include "ft_i2c.h"


FT_I2C::FT_I2C(unsigned int size, unsigned char SDA, unsigned char SCL, unsigned char SDAREAD)
{
    this->scl = (1 << SCL);
    this->sda = (1 << SDA);
    this->sda_read = (1 << SDAREAD);
    this->ft = new FTHight(0, 9600,((~this->sda_read)), SYNC_MODE, 255);
    this->input_data = new unsigned char[size];
}

void FT_I2C::put_start()
{
    *ft << (sda | scl) << scl << 0;
}

void FT_I2C::put_stop()
{
    *ft << 0 << scl << scl << (sda | scl);
}

void FT_I2C::put_byte(unsigned char data)
{
    int i;
    for(i=0; i<8; i++)
    {
        unsigned char current_bit;

        if (data & (128 >> i))
            current_bit = sda;
        else 
            current_bit = 0;

        *ft << current_bit;
        *ft << (current_bit | scl);
        *ft << current_bit;
    }

    *ft << sda;
    *ft << (sda | scl);
    *ft << sda;
}

void FT_I2C::send()
{
    //ft->send_read(input_data);
    ft->send();
}

void FT_I2C::send_read(unsigned char * input_data, unsigned int * recived)
{
    ft->send_read(input_data, recived);
}


void FT_I2C::print(bool is_hex)
{
    ft->print(is_hex);
}

void FT_I2C::clear()
{
    ft->clear();
}
