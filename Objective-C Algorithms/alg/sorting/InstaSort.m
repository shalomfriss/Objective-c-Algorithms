//
//  InstaSort.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/13/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "InstaSort.h"
#import "InstaSortItem.h"

@implementation InstaSort

/**
    An insta sort item has a key and a value.  The only stipulation is that the keys start at 0 and are 
    all consecutive
 
    what happens is  there is an initial pointer to the first position of the array to be sorted
    we add the value of the key (an integer in a series of consecutive integers) to the pointer
    which is the corresponding position in the array that the pointer should be.  We save a pointer
    to that item and replace it with the new items.  We now repeat.  This will sort the array in exactly
    O(2N) time.  There will be 0 comparisons and 2N assignments
*/
-(NSMutableArray<InstaSortItem *> *)sort:(NSMutableArray<InstaSortItem *> *)unsorted
{
    //NSMutableArray *sorted = [[NSMutableArray alloc] init];
    
    
    NSArray<InstaSortItem *> *sorted;
    sorted = [unsorted copy];
    
    InstaSortItem *p = sorted[0];
    
    NSLog(@"%@", p);
    //NSLog(@"%@", (p + 1));
    //NSLog(@"%@", &p);
    
    InstaSortItem *old;
    for(NSUInteger i = 0; i < unsorted.count; i++)
    {
        //NSLog(@"%@", p);
    }
    
    
    /*
    for(NSUInteger i = 0; i < sizeof(test)/sizeof(test[0]); i++)
    {
        *(t + test[i]) = &test[i];
    }
    */
    
    /*
    
    NSUInteger test[5];
    NSUInteger sorted[5] = {0};
    NSUInteger *t[10] = {0};
    
    test[0] = 2;
    test[1] = 1;
    test[2] = 9;
    test[3] = 0;
    test[4] = 4;
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    //Can assign directly
    
    
    for(NSUInteger i = 0; i < sizeof(test)/sizeof(test[0]); i++)
    {
        *(t + test[i]) = &test[i];
    }
    
    NSUInteger cnt = 0;
    for(NSUInteger i = 0; i < sizeof(t)/sizeof(t[0]); i++)
    {
        if(t[i])
        {
            NSLog(@"%lu", *t[i]);
            sorted[cnt] = *t[i];
            cnt++;
        }
    }

    */
    
    return nil;
}


@end
