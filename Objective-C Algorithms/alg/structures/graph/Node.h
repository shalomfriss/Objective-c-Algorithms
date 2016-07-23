//
//  Vertex.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/22/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
{
    
}

-(BOOL)isEqual:(Node *)node;

@property (nonatomic, retain) NSMutableArray *adj;
@property (assign) float distance;
@property (nonatomic, retain) Node *parent;
@property (nonatomic, assign) BOOL marked;
@property (nonatomic, assign) id value;


@end
