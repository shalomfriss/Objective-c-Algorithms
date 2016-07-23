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
        self.nodes = [[NSMutableArray<Node *> alloc] init];
        self.edges = [[NSMutableArray<Edge *> alloc] init];
        self.directed = NO;
        self.adjList = [[NSMutableDictionary<Node *, Node *> alloc] init];
    }
    
    return self;
}

-(void)addEdge:(Edge *)e
{
    
    for(NSInteger i = 0; i < self.edges.count; i++)
    {
        Edge *e2 = self.edges[i];
        if([e2.v isEqual:e.v] && [e2.u isEqual:e.u])
        {
            NSLog(@"Edge is contained");
            return;
        }
    }
    
    [self.edges addObject:e];
    [self.adjList setObject:e.u forKey:e.v];
    [self.adjList setObject:e.v forKey:e.u];
    
    /*
    self.adjList = [self.adjList keysSortedByValueUsingComparator: ^(id obj1, id obj2) {
        
        Node *node1 = (Node *)obj1;
        Node *node2 = (Node *)obj2;
        
        if (node1.value > node2.value) {
            
            return (NSComparisonResult)NSOrderedDescending;
        }
        else {
            
            return (NSComparisonResult)NSOrderedAscending;
        }
        
        return (NSComparisonResult)NSOrderedSame;
    }];
     */
}

-(void)removeEdge:(Edge *)e
{
    if([self.edges containsObject:e])
    {
        [self.edges removeObject:e];
    }
    else
    {
        for(NSInteger i = 0; i < self.edges.count; i++)
        {
            Edge *e2 = self.edges[i];
            if([e2.v isEqual:e.v] && [e2.u isEqual:e.u])
            {
                [self.edges removeObject:e2];
                return;
            }
        }
    }
    
}

-(void)generateRandom:(NSInteger)num
{
    for(NSInteger i = 0; i < num; i++)
    {
        Node *v = [[Node alloc] init];
        Node *u = [[Node alloc] init];
        v.value = [NSNumber numberWithFloat:rand()*1000.0];
        u.value = [NSNumber numberWithFloat:rand()*1000.0];
        
        Edge *e = [[Edge alloc] init];
        e.u = u;
        e.v = v;
        [self addEdge:e];
    }
    
    NSLog(@"%@", self.edges);
}

-(void)show
{
    
}

-(void)DFS:(Graph *)graph root:(Node *)rootNode
{
    for(NSUInteger i = 0; i < graph.nodes.count; i++)
    {
        Node *v = graph.nodes[i];
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
        Node *item = (Node *)[S pop];
        if(item.marked == NO)
        {
            item.marked = YES;
            NSMutableArray *adj = item.adj;
            for(NSUInteger j = 0;j < adj.count; j++)
            {
                Node *adjItem = (Node *)adj[j];
                if(adjItem.marked == NO)
                {
                    [S push:adjItem];
                }
            }
        }
        
    }
}


-(void)BFS:(Graph *)graph root:(Node *)rootNode
{
    
    for(NSUInteger i = 0; i < graph.nodes.count; i++)
    {
        Node *v = graph.nodes[i];
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
        Node *item = (Node *)[Q pop];
        NSMutableArray *adj = item.adj;
        for(NSUInteger i = 0; i < adj.count; i++)
        {
            Node *adjItem = (Node *)adj[i];
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
