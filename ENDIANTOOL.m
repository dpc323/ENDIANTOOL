//
//  ENDIANTOOL.m
//  heyizhengpin
//
//  Created by 合一 on 2018/3/28.
//  Copyright © 2018年 合一. All rights reserved.
//

#import "ENDIANTOOL.h"

@implementation ENDIANTOOL

/****
  把x86cpu低字节编码转成高字节序编码原理就是把数据的低位数值往右移取值（一个个Byte取值，所以是移动(len-1-i)*8），从而实现编码的高位存储数值的低位部分
  高低字节序基础：https://www.cnblogs.com/lidabo/p/3777011.html
  例如：0x12345678
  低字节序0111，1000 0101，0110 0011，0100 0001，0010
  高字节序0001，0010 0011，0100 0101，0110 0111，1000
*/
//低字节序转高字节序  只有数值才有高低字节序
+ (NSData*)short2BigEndianData:(short)value
{
    int len = sizeof(short);
    Byte *byte = malloc(len);
    for (int i = 0; i < len; i++) {
        byte[i] = (value >> ((len-1-i)*8)) & 0xff;
    }
    
    NSData *data = [NSData dataWithBytes:byte length:len];
    free(byte);
    return data;
}

+ (NSData*)int2BigEndianData:(int)value
{
    int len = sizeof(int);
    Byte *byte = malloc(len);
    for (int i = 0; i < len; i++) {
        byte[i] = (value >> ((len-1-i)*8)) & 0xff;
    }
    
    NSData *data = [NSData dataWithBytes:byte length:len];
    free(byte);
    return data;
}

+ (NSData*)long2BigEndianData:(long)value
{
    int len = sizeof(long);
    Byte *byte = malloc(len);
    for (int i = 0; i < len; i++) {
        byte[i] = (value >> ((len-1-i)*8)) & 0xff;
    }
    
    NSData *data = [NSData dataWithBytes:byte length:len];
    free(byte);
    return data;
}

+ (NSData*)unsignedlonglong2BigEndianData:(unsigned long long)value
{
    int len = sizeof(unsigned long long);
    Byte *byte = malloc(len);
    for (int i = 0; i < len; i++) {
        byte[i] = (value >> ((len-1-i)*8)) & 0xff;
    }
    
    NSData *data = [NSData dataWithBytes:byte length:len];
    free(byte);
    return data;
}
/*
 例如：0x12345678
 高字节序0001，0010 0011，0100 0101，0110 0111，1000
 低字节序0111，1000 0101，0110 0011，0100 0001，0010
 同理高字节序转低字节序数据的低位数值往左移取值，只需要取值就好
 
 这里需要注意的是，数字从网络过来存储内存中是    0111，1000  0
                                         0101，0110  1
                                         0011，0100  2
                                         0001，0010  3
 0-3代表字节低位到高位，
 */
+(short)bigEndianData2Short:(NSData*)data withByteLength:(int)length;
{
    Byte *reppayload = (Byte*)[data bytes];
    short value = 0;
    for (int i =0; i < length; i++) {
        value |= reppayload[i];
        value <<= ((length-1-i)*8);
    }
    return value;
}
@end
