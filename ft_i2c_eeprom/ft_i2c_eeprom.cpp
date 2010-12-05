#include "ft_i2c_eeprom.h"

union IntBytes
{
    struct
    {
        unsigned char hi_byte;
        unsigned char lo_byte;
    };
    unsigned int int_data;
};

FT_I2C_eeprom::FT_I2C_eeprom(unsigned int size, unsigned char SDA, unsigned char SCL, unsigned char dev_address)
{
    fti2c = new FT_I2C(255, 64, 2);
    this->dev_address = dev_address;
}

void FT_I2C_eeprom::write_byte(unsigned int address, unsigned char data)
{
    union IntBytes
    {
        struct
        {
            unsigned char lo_byte;
            unsigned char hi_byte;
        };
        unsigned int int_data;
    } addr;

    addr.int_data = address;

    fti2c->put_start();
    fti2c->put_byte(dev_address);
    fti2c->put_byte(addr.hi_byte);
    fti2c->put_byte(addr.lo_byte);
    fti2c->put_byte(data);
    fti2c->put_stop();
    fti2c->put_byte(0xff);
    fti2c->send(false);
}

unsigned char FT_I2C_eeprom::read_byte(unsigned int address)
{
    union IntBytes
    {
        struct
        {
            unsigned char lo_byte;
            unsigned char hi_byte;
        };
        unsigned int int_data;
    } addr;
    addr.int_data = address;

    fti2c->put_start();
    fti2c->put_byte(dev_address);
    fti2c->put_byte(addr.hi_byte);
    fti2c->put_byte(addr.lo_byte);
    fti2c->put_start();
    fti2c->put_byte(dev_address+1);
    fti2c->put_byte(0xff);
    fti2c->send(false);
}
