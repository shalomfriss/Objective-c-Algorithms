//
//  BubbleSort.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/27/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "BubbleSort.h"

@implementation BubbleSort

-(NSMutableArray *)sort:(NSMutableArray *)items
{
    NSMutableArray *copy = [items mutableCopy];
    
    for(NSInteger i = 0; i < copy.count; i++)
    {
        for(NSInteger j = copy.count - 1; j > i; j--)
        {
            if(copy[j] < copy[j - 1])
            {
                id temp = copy[j];
                copy[j] = copy[j - 1];
                copy[j - 1] = temp;
            }
        }
    }
    return copy;
}

@end
