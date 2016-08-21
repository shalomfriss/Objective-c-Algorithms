//
//  BitUtils.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/25/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "BitUtils.h"

@implementation BitUtils


+(NSUInteger)getBit:(NSUInteger)num index:(NSUInteger)i
{
    return ((num & (1 << i)) != 0 ? 1 : 0);
}

+(NSUInteger)setBit:(NSUInteger)num index:(NSUInteger)i
{
    return (num | (1 << i));
}

+(NSUInteger)clearBit:(NSUInteger)num index:(NSUInteger)i
{
    return (num & ~(1 << i));
}

+(NSUInteger)updateBit:(NSUInteger)num index:(NSUInteger)i value:(NSUInteger)val
{
    if(val >= 1) val = 1; else val = 0;
    NSUInteger mask = ~(1 << i);
    return (num & mask) | (val << i);
}

+(NSUInteger)clearBitsIThrough0:(NSUInteger)num index:(NSUInteger)i
{
    NSUInteger mask = (-1 << (i + 1));
    return num & mask;
}


+(NSUInteger)clearBitsMSThroughI:(NSUInteger)num index:(NSUInteger)i
{
    NSUInteger mask = (1 << i) - 1;
    return num & mask;
}

/*
    Clear bits starting from i and ending at j, here the assumption is that j > i
*/
+(NSUInteger)clearBitsIThroughJ:(NSUInteger)num indexI:(NSUInteger)i indexJ:(NSUInteger)j
{
    NSUInteger mask = 0;
    NSUInteger dist = j - i + 1;
    
    mask = ((1 << dist) - 1);
    mask = (mask << i);
    return num ^ mask;
}

+(void)printNumber:(NSString *)binary
{
    
}


+(void)printBinary:(NSUInteger)num
{
    NSMutableString *str = [NSMutableString stringWithFormat:@""];
    while(num > 0)
    {
        [str insertString:((num & 1) ? @"1" : @"0") atIndex:0];
        num >>= 1;
    }
    
    NSLog(@"%lu: %@", num, str);
}

+(NSMutableArray *)convertToBinary:(NSInteger)num
{
    NSMutableArray<NSNumber *> *bits = [[NSMutableArray<NSNumber *> alloc] init];
    
    NSInteger rem = num % 2;
    NSInteger div = num / 2;
    NSNumber *x = [NSNumber numberWithShort:rem];
    [bits insertObject:x atIndex:0];
    
    //NSLog(@"%lu - %lu", rem, div);
    while(div > 0)
    {
        rem = div % 2;
        div = div / 2;
        
        //NSLog(@"%lu - %lu", rem, div);
        NSNumber *x = [NSNumber numberWithShort:rem];
        [bits insertObject:x atIndex:0];
    }
    
    
    //NSLog(@"%@", bits);
    [self echo:bits];
    return bits;
}

+(void)echo:(NSMutableArray *)bits
{
    NSString *str = @"";
    for(NSInteger i = 0; i < bits.count; i++)
    {
        str = [NSString stringWithFormat:@"%@%@", str, bits[i]];
    }
    
    NSLog(@"%@", str);
}

+(NSInteger)convertToDecimal:(NSMutableArray *)bits
{
    
    NSInteger x = 0;
    NSInteger p = 0;
    
    for(NSInteger i = bits.count - 1; i >= 0; i--)
    {
        x += [(NSNumber *)bits[i] integerValue] == 0 ? 0 : pow(2, p);
        p++;
    }
    
    return x;
}

+(NSMutableArray *)convertFractionToBinary:(NSNumber *)num
{
    NSMutableArray *bits = [[NSMutableArray alloc] init];
    //float theNum = [num floatValue];
    
    
    return bits;
}


+(NSMutableArray *)convertFloatToBinary:(NSNumber *)num
{
    NSMutableArray *bits = [[NSMutableArray alloc] init];
    float thenum = [num floatValue];
    
    //float integer = trunc(thenum);
    //float decimal = thenum - trunc(thenum);
    
    return bits;
    
}


+(BOOL)hasPattern:(NSMutableArray *)bits
{
    
    for(NSInteger i = 0; i < bits.count; i++)
    {
        
    }
    
    return NO;
}



@end
