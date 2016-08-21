//
//  CreateBTFromSortedArray.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/12/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTreeNode.h"
#import "BinaryTree.h"

/**
    Given a sorted (increasing order) array, write an algorithm to create a binary tree with minimal height.
    
    Solution: By definition the items are in increasing order, we just have to create nodes in the same order of 
    the array, this would correspond to a breadth first traversal of the array.
*/
@interface CreateBTFromSortedArray : NSObject
{
    
}

-(BinaryTree *)createBT:(NSMutableArray<NSNumber *> *)items;

@end
