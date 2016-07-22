//
//  Vertex.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/22/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vertex : NSObject
{
    
}

@property (nonatomic, retain) NSMutableArray *adj;
@property (assign) float distance;
@property (nonatomic, retain) Vertex *parent;
@property (nonatomic, assign) BOOL marked;


@end
