//
//  Stack.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/22/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "Stack.h"

@implementation Stack

-(id)init
{
    if(self = [super init])
    {
        [self reset];
    }
    return self;
}

-(void)reset
{
    count = 0;
    index = 0;
    items = [[NSMutableArray alloc] init];
}

-(void)push:(id)item
{
    [items insertObject:item atIndex:count];
    count++;
    index = count - 1;
}

-(id)pop
{
    if(count > 0)
    {
        id item = [items objectAtIndex:index];
        count--;
        index--;
        return item;
    }
    
    return nil;
}

-(BOOL)hasItems
{
    return count > 0 ? YES : NO;
}

@end
