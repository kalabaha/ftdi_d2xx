#include "ft_i2c_eeprom.h"

#define DEVICE 160

#define SDA 6
#define SCL 1
#define SDAREAD 2


int main()
{
    FT_I2C_eeprom fteeprom(1000, SDA, SCL, SDAREAD, DEVICE);
    unsigned char data;
    while (1)
    {
        std::cout << "1 - write" << std::endl;
        std::cout << "2 - read" << std::endl;
        int selector;
        union 
        {
            struct
            {
                unsigned char loByte;
                unsigned char hiByte;
            };
            unsigned int data_int;
        } data;
        unsigned int address = 0;
        data.data_int = 0;
        std::cin >> selector;
        switch (selector)
        {
            case 1:
                std::cout << "---writing---" << std::endl;
                std::cout << "address: ";
                std::cin >> address;
                std::cout << "data: ";
                std::cin >> data.data_int;
                std::cout << "---writing---" << std::endl;
                fteeprom.write_byte(address, data.loByte);
                break;
            case 2:
                std::cout << "---reading---" << std::endl;
                std::cout << "address: ";
                std::cin >> address;
                data.loByte = fteeprom.read_byte(address);
                data.hiByte = 0;
                std::cout << "data = " << data.data_int << std::endl;
                std::cout << "---reading---" << std::endl;
                break;
            default:
                std::cout << "error" << std::endl;
        }
    }
    return 0;
}
