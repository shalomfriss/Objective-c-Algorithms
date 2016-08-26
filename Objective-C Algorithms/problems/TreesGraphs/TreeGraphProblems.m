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
    
    [tree printTree];
    
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
        NSLog(@"Go");
        if(lists.count < cnt + 1)
        {
            NSLog(@"Create array");
            //[lists insertObject:[[NSMutableArray alloc] init] atIndex:cnt];
            [lists addObject:[[NSMutableArray alloc] init]];
        }
        
        NSLog(@"Array created");
        
        NSMutableArray *cArray = [lists objectAtIndex:cnt];
        BTNode *node;
        
        while([q hasItems])
        {
            node = (BTNode *)[q pop];
            if(node.left)
            [q2 push:node.left];
            if(node.right)
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



/*
    Check if a binary tree is balanced (a tree such that the heights of the two subtrees of any node never differ 
    by more then one)
 */
-(BOOL)checkBalanced:(BinaryTree *)tree
{
    return [self isBalanced:tree.root];
    
}

-(BOOL)isBalanced:(BTNode *)node
{
    
    NSInteger left = [self getHeight:node.left];
    NSInteger right = [self getHeight:node.right];
    if(abs(left - right) > 1)
    {
        return NO;
    }
    
    BOOL leftb = [self isBalanced:node.left];
    BOOL rightb = [self isBalanced:node.right];
    
    if(!leftb || !rightb) return NO;
    return YES;
}

-(NSInteger)getHeight:(BTNode *)node
{
    
    Queue *q1 = [[Queue alloc] init];
    Queue *q2 = [[Queue alloc] init];
    
    [q1 push:node];
    NSInteger cnt = 1;
    while(YES)
    {
        [q2 reset];
        while([q1 hasItems] == YES)
        {
            BTNode *node = [q1 pop];
            if(node.left)
                [q2 push:node.left];
            if(node.right)
                [q2 push: node.right];
        }
        
        [q1 reset];
        while([q2 hasItems] == YES)
        {
            [q1 push:[q2 pop]];
        }
        cnt++;
        if([q1 hasItems] == NO && [q2 hasItems] == NO)
        {
            return cnt;
        }
    }
    
    return cnt;
}

@end
