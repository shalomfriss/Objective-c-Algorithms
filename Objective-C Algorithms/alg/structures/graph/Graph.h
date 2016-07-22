//
//  Graph.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/21/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vertex.h"

@interface Graph : NSObject
{
    
}

@property (nonatomic, retain) NSMutableArray *nodes;
-(void)BFS:(Graph *)graph root:(Vertex *)rootNode;

@end
