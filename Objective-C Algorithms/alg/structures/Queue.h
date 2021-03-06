//
//  Queue.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/22/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject
{
    NSMutableArray *items;
    NSUInteger count;
    NSUInteger index;
}

-(void)push:(id)item;
-(id)pop;
-(BOOL)hasItems;
-(void)reset;

@end
