//
//  Quicksort.m
//  FBTest
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/19/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "Quicksort.h"

@implementation Quicksort


-(NSMutableArray *)sort:(NSMutableArray *)items
{
    
    if(items.count < 1)
    {
        return nil;
    }
    
    NSMutableArray *copy = [items mutableCopy];
    
    NSUInteger pivotIndex = (items.count)/2;
    NSNumber *pivot = items[pivotIndex];
    [copy removeObjectAtIndex:pivotIndex];
    
    NSMutableArray *lowArray = [[NSMutableArray alloc] init];
    NSMutableArray *highArray = [[NSMutableArray alloc] init];
    
    
    for(NSUInteger i = 0; i < copy.count; i++)
    {
        if(copy[i] < pivot)
        {
            [lowArray addObject:copy[i]];
        }
        else
        {
            [highArray addObject:copy[i]];
        }
    }
    
    
    NSMutableArray *results = [[NSMutableArray alloc] init];
    [results addObjectsFromArray:[self sort:lowArray]];
    [results addObject:pivot];
    [results addObjectsFromArray:[self sort:highArray]];
    
    return results;
    
}


@end
