//
//  Queue.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/22/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "Queue.h"

@implementation Queue

-(id)init
{
    if(self = [super init])
    {
        [self reset];
    }
    return self;
}

-(void)push:(id)item
{
    [items addObject:item];
    count++;
}

-(void)reset
{
    items = [[NSMutableArray alloc] init];
    count = 0;
    index = 0;
}

-(id)pop
{
    if(count > 0)
    {
        id item = [items objectAtIndex:index];
        count--;
        index++;
        return item;
    }
    
    return nil;
}

-(BOOL)hasItems
{
    return count > 0 ? YES : NO;
}

@end
