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
    
    
    return tree;
}

/**
    This function will print out a binary tree that is completely filled out/balanced.
*/
+(void)printBinaryTree:(NSMutableArray *)tree
{
    
    NSUInteger padding = 2;
    
    //The largest power of 2
    NSUInteger levels = log2(tree.count);
    NSLog(@"Levels: %lu", levels);
    
    //The largest integer we will be dealing with
    NSUInteger largest = pow(2, levels) - 1;
    NSLog(@"Largest integer: %lu", largest);
    
    //The amount of space we will need for each number to make the tree look even
    NSNumber *temp = [NSNumber numberWithUnsignedInteger:largest];
    NSString *temp2 = [temp stringValue];
    NSUInteger size = temp2.length;
    NSLog(@"Max int length: %lu", size);
    
    NSUInteger totalWidth = (size + padding) * pow(2, levels - 1);
    NSLog(@"Total width: %lu", totalWidth);
    NSLog(@"Smallest: %lu - %ul",  pow(2, levels - 1), (totalWidth / pow(2, levels - 1)));
    
    NSUInteger count = 0;
    NSString *output = @"\n\n";
    NSMutableArray *old = [[NSMutableArray alloc] init];
    for(NSUInteger i = 1; i < tree.count; i *= 2)
    {
        NSLog(@"%lu", i);
        
        NSMutableArray *new = [[NSMutableArray alloc] init];
        for(NSUInteger j = i; j < i*2; j++)
        {
            NSLog(@"   %lu", j);
            
            NSUInteger loc = (NSUInteger)(totalWidth / (i+1));
            [new addObject:[NSNumber numberWithUnsignedInteger:loc]];
            
            for(NSUInteger k = 0; k < loc + 1; k++)
            {
                output = [output stringByAppendingString:@"-"];
            }
            
            
            //Compensate for single and small digit numbers
            NSString *val = [tree[count] stringValue];
            while(val.length < size)
            {
                val = [val stringByAppendingString:@" "];
            }
            
            output = [output stringByAppendingString:val];
            
            /*
            if(j % 2 == 0)
            {
                //output = [output stringByAppendingString:@"("];
                output = [output stringByAppendingString:val];
            }
            else
            {
                output = [output stringByAppendingString:val];
                //output = [output stringByAppendingString:@")"];
            }
            */
            
            old = [[NSMutableArray alloc] init];
            count++;
        }
        
        NSLog(@"TESTM");
        NSLog(@"%@", new);
        
        
        old = new;
        output = [output stringByAppendingString:@"\n"];
        
    }
    NSLog(@"%@\n\n", output);
    
    
    
}

@end
