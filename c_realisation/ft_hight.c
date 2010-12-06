#include "ft_hight.h"

void ft_hight_init(FT_Struct *ft, unsigned int dev_number, unsigned int baudrate, unsigned char mask, FT_MODE mode, unsigned int data_size)
{
    ft->dev_number = dev_number;
    ft->baudrate = baudrate;
    ft->mask = mask;
    ft->mode = mode;
    ft->data = (unsigned char *) malloc(data_size);
    ft->data_index = 0;
    ft->data_size = 0;
}

void ft_hight_print_data(FT_Struct * ft)
{
    int i;
    for(i=0; i<ft->data_index; i++)
    {
        printf("%04d : %03d : %02X : ", i, ft->data[i], ft->data[i]);
        unsigned char j;
        for(j=0; j<8; j++)
            printf("%d", ((128 >> j) & ft->data[i]) ? 1 : 0);
        printf("\n");
    }
}

void ft_hight_push(FT_Struct * ft, unsigned char b)
{
    ft->data[ft->data_index] = b;
    ft->data_index+=1;
}

void ft_hight_send(FT_Struct * ft)
{
    FT_HANDLE fthandle;
    FT_Open(ft->dev_number, &fthandle);
    FT_SetBaudRate(fthandle, ft->baudrate);
    FT_SetBitMode(fthandle, ft->mask, ft->mode);
    DWORD written;
    FT_Write(fthandle, ft->data, ft->data_index, &written);
    FT_Close(fthandle);
}

void ft_hight_read(FT_Struct * ft, unsigned int count)
{
    FT_HANDLE fthandle;
    FT_Open(ft->dev_number, &fthandle);
    FT_SetBaudRate(fthandle, ft->baudrate);
    FT_SetBitMode(fthandle, ft->mask, ft->mode);
    DWORD recived;
    FT_Read(fthandle, ft->data, count, &recived);
    ft->data_index = recived;
    FT_Close(fthandle);
}

void ft_hight_send_read(FT_Struct * ft)
{
    FT_HANDLE fthandle;
    FT_Open(ft->dev_number, &fthandle);
    FT_SetBaudRate(fthandle, ft->baudrate);
    FT_SetBitMode(fthandle, ft->mask, ft->mode);
    DWORD written;
    FT_Write(fthandle, ft->data, ft->data_index, &written);
    DWORD recived;
    FT_Read(fthandle, ft->data, ft->data_index, &recived);
    ft->data_index = recived;
    FT_Close(fthandle);
}

