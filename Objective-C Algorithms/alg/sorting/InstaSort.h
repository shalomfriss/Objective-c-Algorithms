//
//  InstaSort.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/13/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SortProtocol.h"

/**
    Instant sort an array of integers
*/
@interface InstaSort : NSObject <Sorter>
{
    
}

-(NSMutableArray *)sort:(NSMutableArray *)items;


@end
