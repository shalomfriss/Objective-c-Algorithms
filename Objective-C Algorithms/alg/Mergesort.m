//
//  Mergesort.m
//  FBTest
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/18/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "Mergesort.h"
#import <math.h>
#import "Utils.h"

@implementation Mergesort




-(NSMutableArray *)sort:(NSMutableArray *)items
{
    
    if(items.count == 1)
    {
        return items;
    }
    
    NSMutableArray *arr1 = [[items subarrayWithRange:NSMakeRange(0, items.count/2)] mutableCopy];
    NSMutableArray *arr2 = [[items subarrayWithRange:NSMakeRange(items.count/2, items.count - arr1.count)] mutableCopy];
    
    arr1 = [self sort:arr1];
    arr2 = [self sort:arr2];
    NSMutableArray *result = [self merge:arr1 withArray:arr2];
    return result;
    
}

-(NSMutableArray *)merge:(NSMutableArray *)array1 withArray:(NSMutableArray *)array2
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSMutableArray *a1 = [NSMutableArray arrayWithArray:array1];
    NSMutableArray *a2 = [NSMutableArray arrayWithArray:array2];
    
    
    
    while(a1.count > 0 || a2.count > 0)
    {
        if(a1.count > 0 && a2.count > 0)
        {
            if(a1[0] < a2[0])
            {
                [result addObject:a1[0]];
                [a1 removeObjectAtIndex:0];
            }
            else {
                [result addObject:a2[0]];
                [a2 removeObjectAtIndex:0];
            }
        }
        else if(a1.count > 0 && a2.count <= 0)
        {
            [result addObject:a1[0]];
            [a1 removeObjectAtIndex:0];
        }
        else if(a1.count <= 0 && a2.count > 0)
        {
            [result addObject:a2[0]];
            [a2 removeObjectAtIndex:0];
        }
        
    }
    
    
    return [result copy];
    
}





@end
