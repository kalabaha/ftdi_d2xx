#include "ft_i2c.h"
#include <iostream>

#define SDA 0b01000000
#define SCL 0b00000010
#define SDAREAD 0b00000100

void pByte(unsigned char data)
{
    int i=0;
    for (i; i<8; i++)
    {
        if (data & (128 >> i))
            std::cout << 1;
        else
            std::cout << 0;
    }
    std::cout << std::endl;
} 

int main()
{
    FT_I2C ft(2000, SDA, SCL, SDAREAD);
    ft.put_start();
    ft.put_byte(160);
    ft.put_byte(0);
    ft.put_byte(11);
    ft.put_start();
    ft.put_byte(161);
    ft.put_byte(255);
    ft.put_stop();
    
    //ft.put_start();
    //ft.put_byte(160);
    //ft.put_byte(0);
    //ft.put_byte(11);
    //ft.put_byte(45);

    //ft.put_stop();
    //ft.put_byte(0xff);
    
    ft.print(false);
    unsigned char readed[2000];
    unsigned int recived;
    ft.send_read(readed, &recived);
    int i;
    for (i=0; i<recived; i++)
    {
        std::cout << i << " : ";
        pByte(readed[i]);
    }
}
