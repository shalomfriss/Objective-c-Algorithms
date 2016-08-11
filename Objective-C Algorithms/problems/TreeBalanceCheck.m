//
//  TreeBalanceCheck.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/9/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "TreeBalanceCheck.h"

@implementation TreeBalanceCheck

/**
    Check to make sure a tree is balanced.  -1 represents a missing value in this case
*/
-(BOOL)isBalanced:(NSMutableArray *)tree
{
    for(NSUInteger i = 1; i < tree.count + 1; i *= 2)
    {
        BOOL foundElement = NO;
        BOOL foundNil = NO;
        for(NSUInteger j = i; j < i * 2; j++)
        {
            if([tree[j - 1] integerValue] != -1)
            {
                foundElement = YES;
            }
            else
            {
                foundNil = YES;
            }
        }
        
        if(foundElement == YES && foundNil == YES)
        {
            return NO;
        }
    }
    
    return YES;
}


@end
