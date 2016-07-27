//
//  Quicksort.h
//  FBTest
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/19/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SortProtocol.h"

@interface Quicksort : NSObject <Sorter>
{
    
}

//-(void)quicksort:(NSMutableArray *)items low:(NSUInteger)lowi high:(NSUInteger)highi;
-(NSMutableArray *)sort:(NSMutableArray *)items;


@end
