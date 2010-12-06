#include "ft_i2c.h"
#include <iostream>

#define SDA 0b01000000
#define SCL 0b00000010
#define SDAREAD 0b00000100

int main()
{
    FT_I2C ft(255, SDA, SCL, SDAREAD);
    ft.put_start();
    ft.put_byte(160);
    ft.put_byte(11);
    ft.put_byte(1);
    ft.put_stop();
    ft.put_byte(0xff);
    ft.print(false);
}
