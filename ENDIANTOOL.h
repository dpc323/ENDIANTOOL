//
//  ENDIANTOOL.h
//  heyizhengpin
//
//  Created by 合一 on 2018/3/28.
//  Copyright © 2018年 合一. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ENDIANTOOL : NSObject

//低字节序转高字节序  只有数值才有高低字节序
+ (NSData*)short2BigEndianData:(short)value;
+ (NSData*)int2BigEndianData:(int)value;
+ (NSData*)long2BigEndianData:(long)value;
+ (NSData*)unsignedlonglong2BigEndianData:(unsigned long long)value;

//高字节序转低字节序
+(short)bigEndianData2Short:(NSData*)data withByteLength:(int)length;
@end
