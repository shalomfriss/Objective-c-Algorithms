//
//  InsertionSort.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/26/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "InsertionSort.h"

@implementation InsertionSort

-(NSMutableArray *)sort:(NSMutableArray *)items
{
    NSMutableArray *copy = [items mutableCopy];
    
    for(NSInteger i = 2; i < copy.count; i++)
    {
        NSInteger j = i;
        while(j > 0)
        {
            if(copy[j] < copy[j - 1])
            {
                id temp = copy[j];
                copy[j] = copy[j - 1];
                copy[j - 1] = temp;
            }
            j--;
        }
    }
    
    return copy;
}


@end
