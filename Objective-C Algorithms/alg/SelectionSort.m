//
//  SelectionSort.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/27/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "SelectionSort.h"

@implementation SelectionSort


-(NSMutableArray *)sort:(NSMutableArray *)items
{
    NSMutableArray *copy = [items mutableCopy];
    
    
    for(NSInteger i = 0; i < copy.count; i++)
    {
        NSInteger minIndex = i;
        for(NSInteger j = i; j < copy.count; j++)
        {
            if((NSInteger)copy[j] < (NSInteger)copy[minIndex])
            {
                minIndex = j;
            }
        }
        
        id temp = copy[i];
        copy[i] = copy[minIndex];
        copy[minIndex] = temp;
        
    }
    return copy;
}

@end
