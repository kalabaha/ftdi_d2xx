#include "ft_i2c.h"
#include <iostream>

int main()
{
    FT_I2C ft(255, 64, 2);
    ft.put_start();
    ft.put_byte(160);
    ft.put_byte(11);
    ft.put_byte(1);
    ft.put_stop();
    ft.put_byte(0xff);
    ft.send(false);
}
