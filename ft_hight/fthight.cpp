#include "fthight.h"

void printByte(unsigned char data)
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


FTHight::FTHight(unsigned int dev_number, unsigned int baudrate, unsigned char mask, unsigned char mode, unsigned int size)
{
    this->dev_number = dev_number;
    this->baudrate = baudrate;
    this->mask = mask;
    this->mode = mode;
    this->data = new char[size];
    this->data_size = size;
    this->index = new int;
    *this->index = 0;

    this->clear();
}

FTHight::FTHight(unsigned int size)
{
    this->dev_number = 0;
    this->baudrate = 9600;
    this->mask = 0b01000010;
    this->mode = SYNC_MODE;
    this->data = new char[255];
    this->data_size = 255;
    this->index = new int;
    *this->index = 0;
}

FTHight FTHight::operator<<(char c)
{
    this->data[*this->index] = c;
    *this->index = *this->index + 1;
    return *this;
}

void FTHight::print(bool is_hex)
{
    char hexdigit[] = "0123456789ABCDEF";
    int i;
    std::cout << "----begin----" << std::endl;
    if (is_hex)
        for (i = 0; i < *this->index; i++)
        {
            std::cout << hexdigit[((unsigned char)this->data[i] / 16)];
            std::cout << hexdigit[((unsigned char)this->data[i] % 16)];
            std::cout << " ";
        }
    else
        for (i = 0; i < *this->index; i++)
        {
            //std::cout << this->data[i] << " ";
            std::cout << i << " : ";
            printByte(this->data[i]);
            //std::cout << i << " : " <<(int) this->data[i] << std::endl;
        }
    std::cout << std::endl << "-----end-----" << std::endl;
}

void FTHight::clear()
{
    *this->index = 0;
    int i;
    for (i = 0; i < this->data_size; i++)
        this->data[i] = 0;
}

void FTHight::send()
{
    //FT_HANDLE fthandle;
    //FT_Open(dev_number, &fthandle);
    //FT_SetBaudRate(fthandle, baudrate);
    //FT_SetBitMode(fthandle, mask, mode);
    

    //FT_Close(fthandle);
}
