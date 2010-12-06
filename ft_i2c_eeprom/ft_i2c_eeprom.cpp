#include "ft_i2c_eeprom.h"

union IntBytes
{
    struct
    {
        unsigned char lo_byte;
        unsigned char hi_byte;
    };
    unsigned int int_data;
} addr;

unsigned char extractByte(unsigned char * data, unsigned int offset, unsigned char sda_read )
{
    unsigned char dataByte = 0;
    unsigned char i;
    for (i=0; i<8; i++)
        dataByte |= ((128 >> i) * ((data[i*3+offset] & (1<<sda_read))>>sda_read));

    return dataByte;
}

FT_I2C_eeprom::FT_I2C_eeprom(unsigned int size, unsigned char SDA, unsigned char SCL, unsigned char SDAREAD, unsigned char dev_address)
{
    fti2c = new FT_I2C(size, SDA, SCL, SDAREAD);
    this->dev_address = dev_address;
    this->sda_read = SDAREAD;
    this->size = size;
}

void FT_I2C_eeprom::write_byte(unsigned int address, unsigned char data)
{
    IntBytes addr;

    addr.int_data = address;

    fti2c->put_start();
    fti2c->put_byte(dev_address);
    fti2c->put_byte(addr.hi_byte);
    fti2c->put_byte(addr.lo_byte);
    fti2c->put_byte(data);
    fti2c->put_stop();
    fti2c->put_byte(0xff);
    fti2c->send();
}

unsigned char * FT_I2C_eeprom::read_Nbytes(unsigned int start_address, unsigned int count)
{
    IntBytes addr;
    addr.int_data = start_address;

    fti2c->put_start();
    fti2c->put_byte(dev_address);
    fti2c->put_byte(addr.hi_byte);
    fti2c->put_byte(addr.lo_byte);

    unsigned int i;
    for (i=0; i<count; i++)
    {
        fti2c->put_start();
        fti2c->put_byte(dev_address+1);
        fti2c->put_byte(0xff);
    }

    unsigned char readed[size];
    unsigned int recived;
    fti2c->send_read(readed, &recived);

    unsigned char * buffer;
    buffer = new unsigned char[count];

    for (i=0; i<count; i++)
        buffer[i] = extractByte(readed, 116+i*57, sda_read);
    return buffer;
}

unsigned char FT_I2C_eeprom::read_byte(unsigned int address)
{
    IntBytes addr;

    addr.int_data = address;


    fti2c->put_start();
    fti2c->put_byte(dev_address);
    fti2c->put_byte(addr.hi_byte);
    fti2c->put_byte(addr.lo_byte);
    fti2c->put_start();
    fti2c->put_byte(dev_address+1);
    fti2c->put_byte(0xff);

    unsigned char readed[size];
    unsigned int recived;
    fti2c->send_read(readed, &recived);
    unsigned char res;
    res = extractByte(readed, 116, sda_read);

    return res;
}
