//
//  Utils.m
//  FBTest
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/18/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(void)shuffle:(NSMutableArray *)array
{
    NSUInteger count = array.count;
    if (count < 1) return;
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [array exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

+(NSMutableArray *)getRandomizedArray
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for(NSUInteger i = 0; i < 515; i += 7)
    {
        [items addObject:[NSNumber numberWithInteger:i]];
    }
    
    [Utils shuffle:items];
    return items;
}

+(NSMutableArray *)getRandomizedBinaryTree
{
    NSMutableArray<NSNumber *> *tree = [[NSMutableArray alloc] init];
    NSInteger levels = 4;
    tree[0] = [NSNumber numberWithInteger:-1];
    for(NSInteger i = 0; i < levels; i++)
    {
        NSLog(@"%lu", i);
        for(NSInteger j = pow(2, i); j < pow(2, i + 1) ; j++)
        {
            tree[j] = [NSNumber numberWithInteger: rand() * pow(2, levels + 1)];
        }
    }
    
    return tree;
}

@end
