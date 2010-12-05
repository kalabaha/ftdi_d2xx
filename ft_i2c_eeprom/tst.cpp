#include "ft_i2c_eeprom.h"

int main()
{
    std::cout << "hi" << std::endl;
    FT_I2C_eeprom  fteeprom(255, 64, 2, 160);
    fteeprom.write_byte(13, 1);

    return 0;
}
