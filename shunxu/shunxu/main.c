//
//  main.c
//  shunxu
//
//  Created by Julien 安 on 15/1/8.
//  Copyright (c) 2015年 Julien 安. All rights reserved.
//

#include <stdio.h>

int main()
{
    char arr[1000][1000];
    int i,j;
    for(i=0;getchar()=='\n';i++)
        for(j=0;getchar()!=EOF;j++)
            arr[i][j]=getchar();
    printf("%c",arr[i][j]);
    return 0;
    
}