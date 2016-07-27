//
//  BitUtils.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/25/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "BitUtils.h"

@implementation BitUtils

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
    float theNum = [num floatValue];
    
    
    return bits;
}


+(NSMutableArray *)convertFloatToBinary:(NSNumber *)num
{
    NSMutableArray *bits = [[NSMutableArray alloc] init];
    float thenum = [num floatValue];
    
    float integer = trunc(thenum);
    float decimal = thenum - trunc(thenum);
    
    
    
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
