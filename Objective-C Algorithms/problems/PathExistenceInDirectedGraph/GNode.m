//
//  GNode.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/10/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "GNode.h"

@implementation GNode

-(id)init
{
    if(self = [super init])
    {
        self.adjacentNodes = [[NSMutableArray alloc] init];
        self.visited = NO;
    }
    return self;
}

//Check if there is a path from node1 to node2
-(BOOL)pathExists:(GNode *)node1 node2:(GNode *)n2
{
    NSMutableArray<GNode *> *stack = [[NSMutableArray<GNode *> alloc] init];
    node1.visited = YES;
    [stack addObject: node1];
    NSUInteger qCount = 1;
    
    while(qCount > 0)
    {
        GNode *node = [stack objectAtIndex: 0];
        qCount--;
        
        NSMutableArray *adj = node.adjacentNodes;
        for(NSUInteger j = 0; j < adj.count; j++)
        {
            GNode *temp = adj[j];
            if(temp.visited == YES)
            {
                return NO;
            }
            
            if(temp == n2)
            {
                return YES;
            }
            
            [stack insertObject:adj[j] atIndex:0];
            qCount++;
        }
    }
    
    return NO;
}

@end
