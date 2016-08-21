//
//  PathExistenceInDirectedGraph.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/10/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GNode.h"

/**
 Given a directed graph, design an algorithm to  nd out whether there is a route be- tween two nodes.
 For simplicity, the assumption is made that only nodes that are in the right directions are in the 
 adjacency list.
*/
@interface PathExistenceInDirectedGraph : NSObject
{
    
}

-(BOOL)pathExists:(GNode *)node1 node2:(GNode *)n2;

@end
