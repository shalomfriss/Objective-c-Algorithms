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
    Node *v;
    Node *u;
    
    u = [[Node alloc] init];
    u.value = 100 + 1;
    
    NSMutableArray<Node *> *all = [[NSMutableArray<Node *> alloc] init];

    
    
    NSMutableArray<Node *> *last = [[NSMutableArray<Node *> alloc] init];
    [last addObject:u];
    
    for(NSInteger i = 1; i < num; i++)
    {
        
        NSMutableArray<Node *> *newLast = [[NSMutableArray<Node *> alloc] init];
        
        for(NSInteger k = 0; k < last.count; k++)
        {
            u = [last objectAtIndex:k];
            for(NSInteger j = 1; j < 1 + 6 * rand(); j++)
            {
                v = [[Node alloc] init];
                v.value = (i+1)*100 + k*10 + j;
                
                Edge *e = [[Edge alloc] init];
                e.u = u;
                e.v = v;
                [self addEdge:e];
                NSLog(@"Adding node: %tu %tu", u.value, v.value);
                
                [newLast addObject:v];
            }
        }
        
        last = newLast;
        /*
        v = [[Node alloc] init];
        v.value = 100 + j;
        
        Edge *e = [[Edge alloc] init];
        e.u = u;
        e.v = v;
        [self addEdge:e];
        NSLog(@"Adding node: %tu %tu", u.value, v.value);
        */
        
        
        
        
        
        
        
        
        /*
        Node *rando = [[Node alloc] init];
        rando.value = rand() * num;
        Edge *ex = [[Edge alloc] init];
        ex.u = u;
        ex.v = rando;
        [self addEdge:ex];
        
        Edge *ex2 = [[Edge alloc] init];
        ex2.u = v;
        ex2.v = rando;
        [self addEdge:ex2];
        */
        
        
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
    if(rootNode == nil)
    {
        rootNode = self.nodes[0];
    }
    
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
        
        NSLog(@"check: %tu - %tu", findNode.value, item.value);
        
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
