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
    if(self.root == nil)
    {
        NSLog(@"Empty tree");
        return;
    }
    
    
    [self DFS:self.root precessor:^(BTNode *node) {
        NSString *str = [NSString stringWithFormat:@"%@: %@ %@",
                         (node ? [NSString stringWithFormat:@"%zd", node.value] : @"x"),
                         (node.left ? [NSString stringWithFormat:@"%zd", node.left.value] : @"x"),
                         (node.right ? [NSString stringWithFormat:@"%zd", node.right.value] : @"x")];
        NSLog(@"%@", str);
        
        //NSLog(@"%zd: %zd  %zd", node ? node.value : -1, node.left ? node.left.value : -1, node.right ? node.right.value : -1);
        
    }];
    
}

-(void)findNode:(BTNode *)node
{
    
}


-(void)generateRandom:(NSUInteger)numberOfNodes
{
    NSMutableArray<BTNode *> *items = [[NSMutableArray<BTNode *> alloc] init];
    for(NSUInteger i = 0; i < numberOfNodes; i++)
    {
        BTNode *node = [[BTNode alloc] init];
        node.value = i;
        [items addObject:node];
    }
    
    for (NSUInteger i = items.count; i > 1; i--)
    {
        [items exchangeObjectAtIndex:i - 1 withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
    
    for(NSUInteger i = 0; i < 16; i++)
    {
        [self insertNode:[items objectAtIndex:i]];
    }
}

-(void)deleteNode:(BTNode *)node
{
    NSLog(@"Delete: %lu", node.value);
    if(node.left == nil && node.right == nil)
    {
        node.parent.left == node ? (node.parent.left = nil) : (node.parent.right = nil);
        return;
    }
    
    if(node.left == nil)
    {
        node.parent.left == node ? (node.parent.left = node.right) : (node.parent.right = node.right);
        return;
    }
    
    if(node.right == nil)
    {
        node.parent.left == node ? (node.parent.left = node.left) : (node.parent.right = node.left);
        return;
    }
    
    NSLog(@"two kids");
    //get the right child
    BTNode *rightChild = node.right;
    
    //if there is no left child use the right child itself as the replacement
    if(rightChild.left == nil)
    {
        NSLog(@"kid with nil");
        rightChild.parent = node.parent;
        node.parent.left == node ? (node.parent.left = rightChild) : (node.parent.right = rightChild);
        rightChild.left = node.left;
        
        return;
    }
    
    NSLog(@"2 children");
    //get the left most node of the right child
    while(rightChild.left != nil)
    {
        rightChild = rightChild.left;
    }
    
    //unlink right child from its parent (the node we're deleting)
    rightChild.parent.left == rightChild ? (rightChild.parent.left = nil) : (rightChild.parent.right = nil);
    
    //Set the right child of the node to remove as this nodes right child
    rightChild.right = node.right;
    rightChild.left = node.left;
    
    //Set the new parent
    rightChild.parent = node.parent;
    
    //Set the new reference to our new node
    node.parent.left == node ? (node.parent.left = rightChild) : (node.parent.right = rightChild);
    
}

-(void)insertNode:(BTNode *)node
{
    BTNode *curNode = self.root;
    if(curNode == nil)
    {
        self.root = node;
        return;
    }
    
    
    BTNode *parent;
    while(curNode != nil)
    {
        if(node.value <= curNode.value)
        {
            if(curNode.left == nil)
            {
                if(curNode.value == node.value)
                {
                    return;
                }
                curNode.left = node;
                node.parent = curNode;
                return;
            }
            curNode = curNode.left;
        }
        else
        {
            if(curNode.right == nil)
            {
                if(curNode.value == node.value)
                {
                    return;
                }
                curNode.right = node;
                node.parent = curNode;
                return;
            }
            curNode = curNode.right;
        }
    }
    
}

-(void)printNode:(BTNode *)node
{
    if(node != nil)
    {
        NSLog(@"%lu", node.value);
    }
}

-(void)BFS:(BTNode *)node precessor:(void (^)(BTNode *))proc
{
    Queue *q = [[Queue alloc] init];
    [q push:node];
    
    while(q.hasItems == YES)
    {
        //NSLog(@"Printing");
        
        BTNode *temp = [q pop];
        //[self printNode:temp];
        proc(temp);
        NSLog(@"%@", temp.left);
        NSLog(@"%@", temp.right);
        
        if(temp.left != nil)
        [q push:temp.left];
        if(temp.right != nil)
        [q push:temp.right];
    }
}

-(void)DFS:(BTNode *)node precessor:(void (^)(BTNode *))proc
{
    
    Stack *q = [[Stack alloc] init];
    [q push:node];
    
    while(q.hasItems == YES)
    {
        BTNode *temp = [q pop];
        //[self printNode:temp];
        proc(temp);
        if(temp.left != nil)
            [q push:temp.left];
        if(temp.right != nil)
            [q push:temp.right];

    }
}

-(void)preorderTraverse:(BTNode *)node precessor:(void (^)(BTNode *))proc
{
    if(node != nil)
    {
        [self printNode:node];
        [self preorderTraverse:node.left];
        [self preorderTraverse:node.right];
    }
}

-(void)inorderTraverse:(BTNode *)node
{
    if(node != nil)
    {
        [self preorderTraverse:node.left];
        [self printNode:node];
        [self preorderTraverse:node.right];
    }
}

-(void)postorderTraverse:(BTNode *)node
{
    if(node != nil)
    {
        
        [self preorderTraverse:node.left];
        [self preorderTraverse:node.right];
        [self printNode:node];
    }
}


//Get all the nodes for a certain level starting at 1
-(NSMutableArray<BTNode *> *)getNodesAtLevel:(NSUInteger)level
{
    NSMutableArray<BTNode *> *result = [[NSMutableArray<BTNode *> alloc] init];
                                                
    Stack *s = [[Stack alloc] init];
    NSUInteger cl = 1;
    
    
    [s push: self.root];
    while(s.hasItems == YES)
    {
        
        BTNode *node = (BTNode *)[s pop];
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
