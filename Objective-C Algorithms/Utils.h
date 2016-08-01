//
//  Utils.h
//  FBTest
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/18/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject
{
    
}

+(void)shuffle:(NSMutableArray *)array;
+(NSMutableArray<NSNumber *> *)getRandomizedArray;
+(NSMutableArray<NSNumber *> *)getRandomizedBinaryTree:(NSUInteger)levels;

@end
