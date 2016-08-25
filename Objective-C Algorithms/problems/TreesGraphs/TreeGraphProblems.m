//
//  TreeGraphProblems.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/21/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "TreeGraphProblems.h"
#import "BinaryTree.h"
#import "BTNode.h";

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



@end
