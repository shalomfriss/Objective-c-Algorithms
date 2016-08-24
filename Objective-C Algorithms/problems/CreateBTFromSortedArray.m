//
//  CreateBTFromSortedArray.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/12/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "CreateBTFromSortedArray.h"

@implementation CreateBTFromSortedArray


-(BinaryTree *)createBT:(NSMutableArray<NSNumber *> *)items
{
    
    
    BinaryTree *tree = [[BinaryTree alloc] init];
    BTNode *root = [[BTNode alloc] init];
    root.value = [items[0] integerValue];
    tree.root = root;
    
    NSMutableArray<BTNode *> *cur = [[NSMutableArray<BTNode *> alloc] init];
    for(NSUInteger i = 1; i < items.count + 1; i *= 2)
    {
        if(i == 1)
        {
            [cur addObject:root];
            NSLog(@"Adding 1");
            continue;
        }
        
        
        
        NSLog(@"i: %lu", i);
        NSMutableArray<BTNode *> *new = [[NSMutableArray<BTNode *> alloc] init];
        for(NSUInteger j = i; j < i * 2; j++)
        {
            BTNode *temp = [[BTNode alloc] init];
            temp.value = [[items objectAtIndex:j - 1] integerValue];
            [new addObject:temp];
            
            NSUInteger index = (j/2) % (i/2);
            NSLog(@"parent: %lu", index);
            BTNode *old = [cur objectAtIndex:index];
            
            NSMutableArray<BTNode *> *levelNodes = [tree getNodesAtLevel:i];
            NSLog(@"NDOES: %lu", levelNodes.count);
            
            if(index % 2 == 0)
            {
                old.left = temp;
            }
            else
            {
                old.right = temp;
            }
        }
        cur = new;
    }
    
    
    /*
    BinaryTree *tree = [[BinaryTree alloc] init];
    BTNode *root = [[BTNode alloc] init];
    root.value = [items[0] integerValue];
    
    //NSMutableArray<BTNode *> *cur = [[NSMutableArray<BTNode *> alloc] init];
    //[cur addObject:root];
    
    NSMutableArray<BTNode *> *old = [[NSMutableArray<BTNode *> alloc] init];
    NSMutableArray<BTNode *> *new = [[NSMutableArray<BTNode *> alloc] init];
    
    for(NSUInteger i = 1; i < items.count; i *= 2)
    {
        new = [[NSMutableArray<BTNode *> alloc] init];
        for(NSUInteger j = i; j < 2*i; j++)
        {
            
            BTNode *temp = [[BTNode alloc] init];
            temp.value = [items[i - 1] integerValue];
            [new addObject:temp];
            
            if(i == 1)
            {
                old = new;
                continue;
            }
            
            NSLog(@"%lu", j/2);
            BTNode *node = [old objectAtIndex:(j - 1)/2];
            if(j % 2 == 0)
            {
                node.left = temp;
            }
            else
            {
                node.right = temp;
            }
            
            
        }
        old = new;
       
    }
    */
    
    
    return tree;
}




@end
