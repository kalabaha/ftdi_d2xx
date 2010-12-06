#include "fthight.h"

int main()
{
    std::cout << "hi" << std::endl;

    FTHight ft(0, 9600, 0b11101101, ASYNC_MODE, 255);
    unsigned char data;
    unsigned char prev_data = 0;
    unsigned int recived;
    ft << 0;
    ft.send();
    ft.clear();
    while (true)
    {
        ft.read(&data, 1, &recived);
        if (data != prev_data)
        {
            std::cout << (int)data << std::endl;
            prev_data = data;
        }
    }
    return 0;
}
