//
//  Edge.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/22/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "Edge.h"

@implementation Edge

-(id)init:(Node*)u v:(Node *)vNode
{
    if(self = [super init])
    {
        self.u = u;
        self.v = vNode;
        self.directed = NO;
    }
    
    return self;
}



@end
