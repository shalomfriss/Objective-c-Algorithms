//
//  GNode.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/10/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "GNode.h"

@implementation GNode

-(id)init
{
    if(self = [super init])
    {
        self.adjacentNodes = [[NSMutableArray alloc] init];
        self.visited = NO;
    }
    return self;
}



@end
