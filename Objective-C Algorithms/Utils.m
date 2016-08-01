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

+(NSMutableArray<NSNumber *> *)getRandomizedArray
{
    NSMutableArray<NSNumber *> *items = [[NSMutableArray alloc] init];
    for(NSUInteger i = 0; i < 515; i += 7)
    {
        [items addObject:[NSNumber numberWithInteger:i]];
    }
    
    [Utils shuffle:items];
    return items;
}

+(NSMutableArray<NSNumber *> *)getRandomizedBinaryTree:(NSUInteger)levels
{
    NSMutableArray<NSNumber *> *tree = [[NSMutableArray alloc] init];
    
    tree[0] = [NSNumber numberWithInteger:-1];
    for(NSInteger i = 0; i < levels; i++)
    {
        for(NSInteger j = pow(2, i); j < pow(2, i + 1) ; j++)
        {
            tree[j] = [NSNumber numberWithInteger: j];
        }
    }
    
    [self shuffle:tree];
    
    [self printBinaryTree:tree];
    return tree;
}

/**
    This function will print out a binary tree that is completely filled out/balanced.
*/
+(void)printBinaryTree:(NSMutableArray *)tree
{
    
    NSUInteger padding = 5;
    
    //The largest power of 2
    NSUInteger levels = log2(tree.count);
    
    //The largest integer we will be dealing with because 2^n + 2^n = 2*2^n = 2^(n+1)
    NSUInteger largest = pow(2, levels) + pow(2, levels) - 1;
    
    NSNumber *temp = [NSNumber numberWithUnsignedInteger:largest];
    NSString *temp2 = [temp stringValue];
    //The amount of space we will need for each number to make the tree look even
    NSUInteger size = temp2.length;
    
    NSUInteger totalWidth = (size + padding) * pow(2, levels - 1);
    
    NSUInteger count = 0;
    NSString *output = @"\n\n";
    NSString *spaces = @"";
    for(NSUInteger i = 1; i < tree.count; i *= 2)
    {
         NSLog(@"%u", i);
        for(NSUInteger j = i; j < i*2; j++)
        {
            NSLog(@"   %u", j);
            NSUInteger width = totalWidth / ((i));
            for(NSUInteger k = 0; k < width + 1; k++)
            {
                output = [output stringByAppendingString:@"-"];
            }
            
            //output = [output stringByAppendingString:[tree[count] stringValue]];
            output = [output stringByAppendingString:@"ss"];
            count++;
        }
        output = [output stringByAppendingString:@"\n"];
        
    }
    NSLog(@"%@\n\n", output);
    
    NSLog(@"size: %ul", size);
    NSLog(@"levels: %ul", levels);
    NSLog(@"total size: %ul", tree.count);
    
    
}

@end
