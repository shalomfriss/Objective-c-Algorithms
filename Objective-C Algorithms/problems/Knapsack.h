//
//  Knapsack.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/9/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Knapsack : NSObject
{
    NSMutableArray *maxKnown;
    NSMutableArray *itemsKnown;
}

-(void)findMax:(NSMutableArray *)items capacity:(NSUInteger)cap;

@end
