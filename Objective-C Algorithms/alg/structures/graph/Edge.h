//
//  Edge.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/22/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Edge : NSObject
{
    
}

@property (nonatomic, retain) Node *u;
@property (nonatomic, retain) Node *v;
@property (nonatomic, assign) BOOL directed;

@end
