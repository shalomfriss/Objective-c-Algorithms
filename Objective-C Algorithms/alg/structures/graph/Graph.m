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
    [self.nodes addObject:e.u];
    [self.nodes addObject:e.v];
    
    [e.u.adjacent addObject:e.v];
    [e.v.adjacent addObject:e.u];
    
}

-(void)generateRandom:(NSInteger)num
{
    
    //[NSNumber numberWithFloat:rand() % 100]
    NSInteger last = 0;
    for(NSInteger i = 0; i < num; i += 2)
    {
        Node *v = [[Node alloc] init];
        Node *u = [[Node alloc] init];
        
        v.value = [NSNumber numberWithFloat:i];
        u.value = [NSNumber numberWithFloat:i + 1];
        
        NSLog(@"Adding node: %tu %tu", i, i+1);
        Edge *e = [[Edge alloc] init];
        e.u = u;
        e.v = v;
        [self addEdge:e];
    }
    
   
    
}

-(void)show
{
    for(NSInteger i = 0; i < self.nodes.count; i++)
    {
        NSString *str = @"";
        Node *e = self.nodes[i];
        str = [str stringByAppendingFormat:@"%d: ",(int)e.value];
        for(NSInteger j = 0; j < e.adjacent.count; j++)
        {
            Node *x = e.adjacent[j];
            [str stringByAppendingFormat:@"%d",(int)x.value];
        }
        NSLog(@"%@", str);
    }
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


-(void)processNode:(Node *)node
{
    
}

-(void)BFS:(Graph *)graph root:(Node *)rootNode nodeToFind:(Node *)findNode
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
        if(item.value == findNode.value)
        {
            NSLog(@"Found NODE!!!");
            return;
        }
        
        NSMutableArray *adj = item.adjacent;
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

-(void)DFS:(Graph *)graph root:(Node *)rootNode nodeToFind:(Node *)findNode
{
    //Setup the items
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
            NSMutableArray *adj = item.adjacent;
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




@end
