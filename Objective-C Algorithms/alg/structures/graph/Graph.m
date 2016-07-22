//
//  Graph.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/21/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "Graph.h"
#import "Queue.h"
#import "Stack.h"

@implementation Graph

-(id)init
{
    if(self = [super init])
    {
        self.nodes = [[NSMutableArray alloc] init];
    }
    
    return self;
}


-(void)DFS:(Graph *)graph root:(Vertex *)rootNode
{
    for(NSUInteger i = 0; i < graph.nodes.count; i++)
    {
        Vertex *v = graph.nodes[i];
        //v.distance = INFINITY;
        v.marked = NO;
        v.parent = nil;
    }
    
    //rootNode.distance = 0;
    rootNode.marked = YES;
    rootNode.parent = nil;
    
    Stack *S = [[Stack alloc] init];
    [S push:rootNode];

    while([S hasItems])
    {
        Vertex *item = (Vertex *)[S pop];
        if(item.marked == NO)
        {
            item.marked = YES;
            NSMutableArray *adj = item.adj;
            for(NSUInteger j = 0;j < adj.count; j++)
            {
                Vertex *adjItem = (Vertex *)adj[j];
                if(adjItem.marked == NO)
                {
                    [S push:adjItem];
                }
            }
        }
        
    }
}


-(void)BFS:(Graph *)graph root:(Vertex *)rootNode
{
    
    for(NSUInteger i = 0; i < graph.nodes.count; i++)
    {
        Vertex *v = graph.nodes[i];
        //v.distance = INFINITY;
        v.marked = NO;
        v.parent = nil;
    }
    
    //rootNode.distance = 0;
    rootNode.marked = YES;
    rootNode.parent = nil;
    
    Queue *Q = [[Queue alloc] init];
    [Q push:rootNode];
    
    
    while([Q hasItems])
    {
        Vertex *item = (Vertex *)[Q pop];
        NSMutableArray *adj = item.adj;
        for(NSUInteger i = 0; i < adj.count; i++)
        {
            Vertex *adjItem = (Vertex *)adj[i];
            //if(adjItem.distance == INFINITY)
            if(adjItem.marked == NO)
            {
                //adjItem.distance = item.distance + 1;
                adjItem.marked = YES;
                adjItem.parent = item;
                [Q push:adjItem];
            }
        }
        
    }
    
}

@end
