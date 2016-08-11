//
//  GGraph.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/10/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "GGraph.h"

@implementation GGraph

-(id)init
{
    if(self = [super init])
    {
        self.nodes = [[NSMutableArray alloc] init];
    }
    return self;
}

@end