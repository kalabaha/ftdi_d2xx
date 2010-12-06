#ifndef c_fthight_h
#define c_fthight_h

#ifdef WIN32
#include <windows.h>
#include "../ft_libs_win/FTD2XX.H"
#else
#include "../ft_libs_linux/ftd2xx.h"
#endif

#include <stdio.h>
#include <stdlib.h>

typedef enum _FT_MODE
{
    FT_ASYNC = 1,
    FT_SYNC = 4
} FT_MODE;

typedef struct _FT_Struct
{
    unsigned int dev_number;
    unsigned int baudrate;
    unsigned char mask;
    unsigned char mode;
    unsigned char * data;
    unsigned int data_index;
    unsigned int data_size;
} FT_Struct;


void ft_hight_init(
        FT_Struct *ft,
        unsigned int dev_number,
        unsigned int baudrate,
        unsigned char mask,
        FT_MODE mode,
        unsigned int data_size);

void ft_hight_push(FT_Struct *ft, unsigned char b);

void ft_hight_send(FT_Struct * ft);

void ft_hight_read(FT_Struct *ft, unsigned int count);

void ft_hight_send_read(FT_Struct * ft);

void ft_hight_print_data(FT_Struct * ft);

#endif
