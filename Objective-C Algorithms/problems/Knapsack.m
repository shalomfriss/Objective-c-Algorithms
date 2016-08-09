//
//  Knapsack.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/9/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "Knapsack.h"

@implementation Knapsack

-(id)init
{
    if(self = [super init])
    {
        maxKnown = [[NSMutableArray alloc] init];
        itemsKnown = [[NSMutableArray alloc] init];
    }
    return self;
}


-(int)findMax:(NSMutableArray *)items capacity:(NSUInteger)cap
{
    int i, space, max, maxi = 0, t;
    if(maxKnown[cap] != nil) return maxKnown[cap];
    //for(i = 0, max = 0; i < M)
    
    return 0;
}

@end
