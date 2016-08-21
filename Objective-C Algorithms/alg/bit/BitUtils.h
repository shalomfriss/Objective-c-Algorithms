//
//  BitUtils.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/25/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BitUtils : NSObject
{
    //NSMutableArray<NSNumber *> *buff;
    
}


+(NSMutableArray *)convertToBinary:(NSInteger)num;
+(NSInteger)convertToDecimal:(NSMutableArray *)bits;
+(void)echo:(NSMutableArray *)bits;
+(NSMutableArray *)convertFractionToBinary:(NSNumber *)num;
+(NSMutableArray *)convertFloatToBinary:(NSNumber *)num;
+(BOOL)hasPattern:(NSMutableArray *)bits;

+(NSUInteger)getBit:(NSUInteger)num index:(NSUInteger)i;
+(NSUInteger)setBit:(NSUInteger)num index:(NSUInteger)i;
+(NSUInteger)clearBit:(NSUInteger)num index:(NSUInteger)i;
+(NSUInteger)updateBit:(NSUInteger)num index:(NSUInteger)i value:(NSUInteger)val;

+(void)printBinary:(NSUInteger)num;

+(NSUInteger)clearBitsMSThroughI:(NSUInteger)num index:(NSUInteger)i;
+(NSUInteger)clearBitsIThroughJ:(NSUInteger)num indexI:(NSUInteger)i indexJ:(NSUInteger)j;

@end
