//
//  PathExistenceInDirectedGraph.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/10/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "PathExistenceInDirectedGraph.h"

@implementation PathExistenceInDirectedGraph

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
            
            //Cycle detected so no
            if(temp.visited == YES)
            {
                return NO;
            }
            
            //Yes there is a path
            if(temp == n2)
            {
                return YES;
            }
            
            temp.visited = YES;
            [stack insertObject:adj[j] atIndex:0];
            qCount++;
        }
    }
    
    return NO;
    
   
}

@end
