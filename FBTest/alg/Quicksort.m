//
//  Quicksort.m
//  FBTest
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/19/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "Quicksort.h"

@implementation Quicksort


-(void)quicksort:(NSMutableArray *)items low:(NSUInteger)lowi high:(NSUInteger)highi
{
    NSUInteger pivotIndex = items.count/2;
    
    
    while(lowi < highi)
    {
        while(items[lowi] < items[pivotIndex])
        {
            lowi++;
        }
        
        while(items[highi] > items[pivotIndex])
        {
            highi--;
        }
        
        id temp = items[lowi];
        [items setObject:items[highi] atIndexedSubscript:lowi];
        [items setObject:temp atIndexedSubscript:highi];
    }
    
    [self quicksort:items low:0 high:pivotIndex - 1];
    [self quicksort:items low:pivotIndex + 1 high:items.count];
    
    
}



@end
