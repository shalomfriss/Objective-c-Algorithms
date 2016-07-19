//
//  Utils.m
//  FBTest
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/18/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(void)shuffle:(NSMutableArray *)array
{
    NSUInteger count = array.count;
    if (count < 1) return;
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [array exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

@end
