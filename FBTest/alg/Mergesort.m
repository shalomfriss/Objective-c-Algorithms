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

-(void)test
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for(NSUInteger i = 0; i < 515; i += 7)
    {
        [items addObject:[NSNumber numberWithInteger:i]];
    }
    
    
    [Utils shuffle:items];
    NSLog(@"%lu", items.count);
    NSLog(@"%@", items);
    
    NSArray *result = [self mergesort:[items copy]];
    
    NSLog(@"%lu", items.count);
    NSLog(@"%@", result);
    
    
}



-(NSArray *)mergesort:(NSArray *)items
{
    
    if(items.count == 1)
    {
        NSArray *res = [NSArray arrayWithObjects:items[0], nil];
        return res;
    }
    
    NSArray *arr1 = [items subarrayWithRange:NSMakeRange(0, items.count/2)];
    NSArray *arr2 = [items subarrayWithRange:NSMakeRange(items.count/2, items.count - arr1.count)];
    
    //NSLog(@"%@ %@", arr1, arr2);
    arr1 = [self mergesort:arr1];
    arr2 = [self mergesort:arr2];
    NSArray *result = [self merge:arr1 withArray:arr2];
    return result;
    
    
}

-(NSArray *)merge:(NSArray *)array1 withArray:(NSArray *)array2
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSMutableArray *a1 = [NSMutableArray arrayWithArray:array1];
    NSMutableArray *a2 = [NSMutableArray arrayWithArray:array2];
    
    
    //NSLog(@"%lu - %lu", array1.count, array2.count);
    
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
        
        //NSLog(@"%lu - %lu", i, result[i]);
    }
    
    /*
    NSLog(@"---------------------------------------------------");
    NSLog(@"%@ %@", array1, array2);
    NSLog(@"%@", result);
    */
     
    return [result copy];
    
}





@end
