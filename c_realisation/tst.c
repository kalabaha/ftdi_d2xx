#include "ft_i2c.h"

#define SCL 1
#define SDA 6
#define SDAREAD 2
#define DEV_ADDR 160

typedef union
{
    struct
    {
        unsigned char lo_byte;
        unsigned char hi_byte;
    };
    unsigned int int_data;
} IntByte;

int main()
{
    IntByte data;
    FT_Struct ft;
    FT_I2C_Struct fti2c;

    ft_hight_init(&ft, 0, 9600, ~ (1 << SDAREAD), FT_SYNC, 1000);
    ft_i2c_init(&fti2c, &ft, SCL, SDA, SDAREAD);

    /*ft_i2c_eeprom_write_byte(&fti2c, DEV_ADDR, 300, 76);*/

    data.lo_byte = ft_i2c_eeprom_read_byte(&fti2c, DEV_ADDR, 300);
    data.hi_byte = 0;
    printf("data: %d\n",data.int_data);
}
