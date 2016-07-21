//
//  Mergesort.h
//  FBTest
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/18/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mergesort : NSObject
{
    
}

-(NSArray *)mergesort:(NSArray *)items;
-(NSArray *)merge:(NSArray *)array1 withArray:(NSArray *)array2;
-(void)test;

@end
