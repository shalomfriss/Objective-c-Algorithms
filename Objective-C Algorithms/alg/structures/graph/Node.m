//
//  Vertex.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/22/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "Node.h"

@implementation Node


-(id)init
{
    if(self = [super init])
    {
        self.distance = INFINITY;
        self.parent = nil;
        self.marked = NO;
        self.value = nil;
        self.adjacent = [[NSMutableArray<Node *> alloc] init];
        
    }
    return self;
}

-(BOOL)isEqual:(Node *)node
{
    if(self.value == node.value)
    {
        return YES;
    }
    return NO;
}

@end
