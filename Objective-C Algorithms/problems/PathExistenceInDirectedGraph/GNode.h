//
//  GNode.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/10/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNode : NSObject 
{
    
}

@property (nonatomic, strong) NSMutableArray<GNode *> *adjacentNodes;
@property (assign)BOOL visited;

-(BOOL)pathExists:(GNode *)node1 node2:(GNode *)n2;

@end