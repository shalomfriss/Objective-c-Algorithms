//
//  MaxPath.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/30/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "MaxPath.h"


@implementation MaxPath

-(NSUInteger)findMax:(NSMutableArray<NSNumber *> *)items
{
    NSUInteger max = 0;
    for(NSUInteger i = 1; i < items.count + 1; i *= 2)
    {
        
        if(!items[i])
        {
            continue;
        }
        
        NSUInteger cmax = max;
        for(NSUInteger j = i; j < i * 2; j++)
        {
            if(max + [items[j - 1] integerValue] > cmax)
            {
                cmax = max + [items[j - 1] integerValue];
            }
        }
        max = cmax;
        
    }
    
    return max;
}

@end
