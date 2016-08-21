//
//  BinaryTree.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/14/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTreeNode.h"

@interface BinaryTree : NSObject
{
    
}

@property (nonatomic, strong) BinaryTreeNode *root;
-(NSMutableArray<BinaryTreeNode *> *)getNodesAtLevel:(NSUInteger)level;
-(void)resetVisited;

-(void)insertNode:(BinaryTreeNode *)node;
-(void)printNode:(BinaryTreeNode *)node;
-(void)BFS:(BinaryTreeNode *)node;
-(void)DFS:(BinaryTreeNode *)node;
-(void)preorderTraverse:(BinaryTreeNode *)node;
-(void)inorderTraverse:(BinaryTreeNode *)node;
-(void)postorderTraverse:(BinaryTreeNode *)node;
-(void)printTree;

@end
