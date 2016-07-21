//
//  Quicksort.m
//  FBTest
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/19/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "Quicksort.h"

@implementation Quicksort


-(NSMutableArray *)quicksort:(NSMutableArray *)items
{
    NSUInteger pivotIndex = (items.count)/2;
    if(pivotIndex <= 0)
    {
        return items;
    }
    
    NSNumber *pivot = items[pivotIndex];
    [items removeObjectAtIndex:pivotIndex];
    
    NSMutableArray *lowArray = [[NSMutableArray alloc] init];
    NSMutableArray *highArray = [[NSMutableArray alloc] init];
    
    
    for(NSUInteger i = 0; i < items.count; i++)
    {
        if(items[i] < pivot)
        {
            [lowArray addObject:items[i]];
        }
        else
        {
            [highArray addObject:items[i]];
        }
    }
    
    lowArray = [self quicksort:lowArray];
    highArray = [self quicksort:highArray];
    
    NSMutableArray *results = [[NSMutableArray alloc] init];
    [results addObjectsFromArray:lowArray];
    [results addObject:pivot];
    [results addObjectsFromArray:highArray];
    
    
    //NSLog(@"%@", results);
    
    return results;
    //[items insertObject:pivot atIndex:low];
    //NSLog(@"Done");
    
    
    
    /*
    while(lowi < highi)
    {
        NSLog(@"LOW:HIGH: %lu-%lu", lowi, highi);
        while(items[lowi] < pivot)
        {
            lowi++;
        }
        
        while(items[highi] > pivot)
        {
            highi--;
        }
        
        if(lowi >= highi)
        {
            [self quicksort:items low:0 high:pivotIndex - 1];
            [self quicksort:items low:pivotIndex + 1 high:items.count-1];
            return;
        }
        
        id temp = items[lowi];
        [items setObject:items[highi] atIndexedSubscript:lowi];
        [items setObject:temp atIndexedSubscript:highi];
        temp = nil;
    }
    */
    
    
    //[items insertObject:pivot atIndex:lowi];
    
    
}


/*
-(void)quicksort:(NSMutableArray *)items low:(NSUInteger)lowi high:(NSUInteger)highi
{
    
    NSUInteger pivotIndex = lowi + (highi - lowi)/2;
    if(pivotIndex <= 0)
    {
        return;
    }
    
    
    NSLog(@"PIVOT: %lu", pivotIndex);
    id pivot = items[pivotIndex];
    [items removeObjectAtIndex:pivotIndex];
    
    
    while(lowi < highi)
    {
        NSLog(@"LOW:HIGH: %lu-%lu", lowi, highi);
        while(items[lowi] < pivot)
        {
            lowi++;
        }
        
        while(items[highi] > pivot)
        {
            highi--;
        }
        
        if(lowi >= highi)
        {
            [self quicksort:items low:0 high:pivotIndex - 1];
            [self quicksort:items low:pivotIndex + 1 high:items.count-1];
            return;
        }
        
        id temp = items[lowi];
        [items setObject:items[highi] atIndexedSubscript:lowi];
        [items setObject:temp atIndexedSubscript:highi];
        temp = nil;
    }
    
    [items insertObject:pivot atIndex:lowi];
    
    
}
*/


@end
