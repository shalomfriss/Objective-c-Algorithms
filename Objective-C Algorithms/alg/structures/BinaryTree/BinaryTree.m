//
//  BinaryTree.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/14/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "BinaryTree.h"
#import "Stack.h"
#import "Queue.h"

@implementation BinaryTree

-(void)printTree
{
    
    [self DFS:self.root precessor:^(BinaryTreeNode *node) {
        NSLog(@"%lu: %lu  %lu", node ? node.value : 0, node.left ? node.left.value : 0, node.right ? node.right.value : 0);
    }];
    
}


-(void)insertNode:(BinaryTreeNode *)node
{
    BinaryTreeNode *curNode = self.root;
    if(curNode == nil)
    {
        self.root = node;
        return;
    }
    
    NSLog(@"Inserting");
    while(curNode != nil)
    {
        if(node.value < curNode.value)
        {
            if(curNode.left == nil)
            {
                curNode.left = node;
                return;
            }
            curNode = curNode.left;
        }
        else
        {
            if(curNode.right == nil)
            {
                curNode.right = node;
                return;
            }
            curNode = curNode.right;
        }
    }
    
}

-(void)printNode:(BinaryTreeNode *)node
{
    if(node != nil)
    {
        NSLog(@"%lu", node.value);
    }
}

-(void)BFS:(BinaryTreeNode *)node precessor:(void (^)(BinaryTreeNode *))proc
{
    Queue *q = [[Queue alloc] init];
    [q push:node];
    
    while(q.hasItems == YES)
    {
        BinaryTreeNode *temp = [q pop];
        //[self printNode:temp];
        proc(temp);
        [q push:temp.left];
        [q push:temp.right];
    }
}

-(void)DFS:(BinaryTreeNode *)node precessor:(void (^)(BinaryTreeNode *))proc
{
    Stack *q = [[Stack alloc] init];
    [q push:node];
    
    while(q.hasItems == YES)
    {
        BinaryTreeNode *temp = [q pop];
        //[self printNode:temp];
        proc(temp);
        [q push:temp.left];
        [q push:temp.right];
    }
}

-(void)preorderTraverse:(BinaryTreeNode *)node precessor:(void (^)(BinaryTreeNode *))proc
{
    if(node != nil)
    {
        [self printNode:node];
        [self preorderTraverse:node.left];
        [self preorderTraverse:node.right];
    }
}

-(void)inorderTraverse:(BinaryTreeNode *)node
{
    if(node != nil)
    {
        [self preorderTraverse:node.left];
        [self printNode:node];
        [self preorderTraverse:node.right];
    }
}

-(void)postorderTraverse:(BinaryTreeNode *)node
{
    if(node != nil)
    {
        
        [self preorderTraverse:node.left];
        [self preorderTraverse:node.right];
        [self printNode:node];
    }
}


//Get all the nodes for a certain level starting at 1
-(NSMutableArray<BinaryTreeNode *> *)getNodesAtLevel:(NSUInteger)level
{
    NSMutableArray<BinaryTreeNode *> *result = [[NSMutableArray<BinaryTreeNode *> alloc] init];
                                                
    Stack *s = [[Stack alloc] init];
    NSUInteger cl = 1;
    
    
    [s push: self.root];
    while(s.hasItems == YES)
    {
        
        BinaryTreeNode *node = (BinaryTreeNode *)[s pop];
        [s push:node.left];
        cl++;
        [s push:node.right];
        cl++;
        if(cl >= level && cl < level *2)
        {
            [result addObject:node.left];
            [result addObject:node.right];
        }
        
    }
    return result;
    
}

//Reset all the node values to unvisited
-(void)resetVisited
{
    
}


@end
