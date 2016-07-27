//
//  SelectionSort.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/27/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SortProtocol.h"

@interface SelectionSort : NSObject <Sorter>
{
    
}

-(NSMutableArray *)sort:(NSMutableArray *)items;

@end
