//
//  Graph.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/21/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
#import "Edge.h"
#import "DebugUtils.h"

#define DEBUG_MODE YES

@interface Graph : NSObject
{
    
}

@property (nonatomic, retain) NSMutableArray<Node *> *nodes;
@property (nonatomic, retain) NSMutableArray<Edge *> *edges;
@property (nonatomic, assign) BOOL directed;

-(void)generateRandom:(NSInteger)num;
-(void)BFS:(Graph *)graph root:(Node *)rootNode nodeToFind:(Node *)findNode;
-(void)DFS:(Graph *)graph root:(Node *)rootNode nodeToFind:(Node *)findNode;
-(void)show;

@end
