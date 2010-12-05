#ifndef fthight_h
#define fthight_h

#ifdef WIN32
#include <windows.h>
#include "../ft_libs_win/FTD2XX.H"
#else
#include "../ft_libs_linux/ftd2xx.h"
#endif

#include <iostream>

#define SYNC_MODE 4
#define ASYNC_MODE 1

class FTHight
{
    unsigned int dev_number;
    unsigned int baudrate;
    unsigned char mask;
    unsigned char mode;
    char * output_data;
    int * index;
    unsigned int data_size;
public:
    FTHight(unsigned int dev_number, unsigned int baudrate, unsigned char mask, unsigned char mode, unsigned int size);
    FTHight(unsigned int size);
    void print(bool is_hex);
    void send();
    void send_read(unsigned char * input_data, unsigned int * readed);
    void clear();
    FTHight operator<< (char new_item);
};

#endif 
