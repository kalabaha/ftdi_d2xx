#include "../ft_i2c/ft_i2c.h"

class FT_I2C_eeprom
{
    FT_I2C * fti2c;
    unsigned char sda_read;
    unsigned char dev_address;
    unsigned int size;
public:
    FT_I2C_eeprom(unsigned int size, unsigned char SDA, unsigned char SCL, unsigned char SDAREAD, unsigned char dev_address);
    void write_byte(unsigned int address, unsigned char data);
    unsigned char read_byte(unsigned int address);
    unsigned char * read_Nbytes(unsigned int start_address, unsigned int count);
    FT_STATUS read_byte(unsigned int address, unsigned char * data);
};
