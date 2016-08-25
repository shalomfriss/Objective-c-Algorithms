//
//  TreeGraphProblems.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/21/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "TreeGraphProblems.h"
#import "BinaryTree.h"
#import "BTNode.h"
#import "Queue.h"


@implementation TreeGraphProblems

/*
 Given a sorted (increasing order) array with unique integer elements, write an algo­
 rithm to create a binary search tree with minimal height..
 */
-(void)minimalTree:(NSMutableArray *)items
{
    NSUInteger mid = items.count/2;
    BinaryTree *bt = [[BinaryTree alloc] init];
    
}

-(BTNode *)arrange:(BTNode *)node items:(NSMutableArray *)arr l:(NSUInteger)left r:(NSUInteger)right
{
    BTNode *temp = [[BTNode alloc] init];
    NSUInteger mid = arr.count/2;
    
    
    return temp;
}

/*
    Given a binary tree create a linked list of all nodes at each depth.  If you have a tree of depth
    D you will have D linked lists
 */
-(NSMutableArray *)createDepthLists:(BinaryTree *)tree
{
    
    NSMutableArray *lists = [[NSMutableArray alloc] init];
    [lists insertObject:[[NSMutableArray alloc] init] atIndex:0];
    NSMutableArray *cArray = [lists objectAtIndex:0];
    [cArray addObject:tree.root];
    
    Queue *q = [[Queue alloc] init];
    Queue *q2 = [[Queue alloc] init];
    
    
    [q push:tree.root];
    
    NSInteger cnt = 1;
    
    while(YES)
    {
        if([lists objectAtIndex:cnt] == nil)
        {
            [lists insertObject:[[NSMutableArray alloc] init] atIndex:cnt];
        }
        
        NSMutableArray *cArray = [lists objectAtIndex:cnt];
        BTNode *node;
        
        while([q hasItems])
        {
            node = (BTNode *)[q pop];
            [q2 push:node.left];
            [q2 push:node.right];
        }
        
        while([q2 hasItems])
        {
            node = [q2 pop];
            [q push:node];
            [cArray addObject:node];
        }
        
        if([q hasItems] == NO && [q2 hasItems] == NO)
        {
            break;
        }
        cnt++;
    }
    
    [q reset];
    [q2 reset];
    
    
    return lists;
}



-(void)checkBalanced
{
    
}

@end
