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
        items = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)push:(id)item
{
    [items insertObject:item atIndex:0];
}

-(id)pop
{
    if(items.count > 0)
    {
        id item = [items objectAtIndex:items.count - 1];
        [items removeObjectAtIndex:items.count - 1];
        return item;
    }
    
    return nil;
}

-(BOOL)hasItems
{
    return items.count > 0 ? YES : NO;
}

@end
