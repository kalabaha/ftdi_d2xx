#include "fthight.h"

int main()
{
    std::cout << "hi" << std::endl;

    FTHight ft(0, 9600, 0b11101101, SYNC_MODE, 255);
    unsigned char data;
    unsigned char prev_data = 0;
    unsigned int recived;
    ft << 0;
    ft.send();
    ft.clear();
    while (true)
    {
        ft << 0;
        ft.send_read(&data, &recived);
        if (data != prev_data)
        {
            prev_data = data;
            std::cout << (int)data << std::endl;
        }
        ft.clear();
    }
    return 0;
}
