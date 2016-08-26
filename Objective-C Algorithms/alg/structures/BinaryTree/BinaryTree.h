//
//  BinaryTree.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/14/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTNode.h"

@interface BinaryTree : NSObject
{
    
}

@property (nonatomic, strong) BTNode *root;
-(NSMutableArray<BTNode *> *)getNodesAtLevel:(NSUInteger)level;
-(void)resetVisited;

-(void)insertNode:(BTNode *)node;
-(void)printNode:(BTNode *)node;
-(void)BFS:(BTNode *)node;
-(void)DFS:(BTNode *)node;
-(void)preorderTraverse:(BTNode *)node;
-(void)inorderTraverse:(BTNode *)node;
-(void)postorderTraverse:(BTNode *)node;
-(void)printTree;
-(void)deleteNode:(BTNode *)node;
-(void)generateRandom:(NSUInteger)numberOfNodes;

@end
