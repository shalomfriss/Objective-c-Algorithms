//
//  MaxPath.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/30/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "MaxPath.h"


@implementation MaxPath

-(void)implicitHeapFind:(NSMutableArray *)items
           currentIndex:(NSInteger)cIndex
           currentTotal:(NSInteger)cTotal

{
    cTotal += (NSInteger)items[cIndex];
    if(cIndex * 2 >= items.count)
    {
        NSLog(@"%ld", (long)cTotal);
        return;
    }
    [self implicitHeapFind:items currentIndex:cIndex * 2 currentTotal:cTotal];
    [self implicitHeapFind:items currentIndex:cIndex * 2 + 1 currentTotal:cTotal];
}

@end
