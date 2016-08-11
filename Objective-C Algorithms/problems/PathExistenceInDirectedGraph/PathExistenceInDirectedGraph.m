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
    BOOL pe = [node1 pathExists:node1 node2:n2];
    return pe;
}

@end
