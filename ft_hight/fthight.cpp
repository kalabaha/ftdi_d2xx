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
    this->output_data = new char[size];
    this->data_size = size;
    this->index = new int;
    *this->index = 0;

    this->clear();
}

FTHight::FTHight(unsigned int size)
{
    this->dev_number = 0;
    this->baudrate = 9600;
    this->mask = 0b11111111;
    this->mode = SYNC_MODE;
    this->output_data = new char[size];
    this->data_size = size;
    this->index = new int;
    *this->index = 0;
}

FTHight FTHight::operator<<(char c)
{
    output_data[*index] = c;
    *index = *index + 1;
    return *this;
}

void FTHight::print(bool is_hex)
{
    char hexdigit[] = "0123456789ABCDEF";
    int i;
    std::cout << "----begin----" << std::endl;
    if (is_hex)
        for (i = 0; i < *index; i++)
        {
            std::cout << i << " : ";
            std::cout << hexdigit[((unsigned char)output_data[i] / 16)];
            std::cout << hexdigit[((unsigned char)output_data[i] % 16)];
            std::cout << std::endl;
        }
    else
        for (i = 0; i < *index; i++)
        {
            std::cout << i << " : ";
            printByte(output_data[i]);
            //std::cout << (int)output_data[i] << std::endl;
        }
    std::cout << std::endl << "-----end-----" << std::endl;
}

void FTHight::clear()
{
    *index = 0;
    int i;
    for (i = 0; i < data_size; i++)
        output_data[i] = 0;
}

void FTHight::send()
{
    DWORD written;

    FT_HANDLE fthandle;
    FT_Open(dev_number, &fthandle);
    FT_SetBaudRate(fthandle, baudrate);
    FT_SetBitMode(fthandle, mask, mode);
    FT_Write(fthandle, output_data, (DWORD)*index, &written);
    FT_Close(fthandle);
    this->clear();
}

void FTHight::read(unsigned char * input_data, unsigned int toRead, unsigned int *recived)
{
    FT_HANDLE fthandle;
    FT_Open(dev_number, &fthandle);
    FT_SetBaudRate(fthandle, baudrate);
    FT_SetBitMode(fthandle, mask, mode);
    FT_Read(fthandle, input_data, (DWORD)toRead, (DWORD*)recived);
    FT_Close(fthandle);
}

void FTHight::send_read(unsigned char * input_data, unsigned int * readed)
{
    DWORD written;

    FT_HANDLE fthandle;
    FT_Open(dev_number, &fthandle);
    FT_SetBaudRate(fthandle, baudrate);
    FT_SetBitMode(fthandle, mask, mode);
    FT_Write(fthandle, output_data, (DWORD)*index, &written);
    FT_Read(fthandle, input_data, (DWORD)*index, (DWORD*)readed);
    FT_Close(fthandle);
    this->clear();
}

