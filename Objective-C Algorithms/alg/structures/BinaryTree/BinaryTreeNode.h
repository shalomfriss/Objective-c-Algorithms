//
//  BinaryTreeNode.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/14/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject
{
    
}

@property (nonatomic, strong) BinaryTreeNode *left;
@property (nonatomic, strong) BinaryTreeNode *right;
@property (assign) NSUInteger value;
@property (assign) NSUInteger level;

-(void)insert:(BinaryTreeNode *)node;
-(void)insertLeftNode:(BinaryTreeNode *)parent child:(BinaryTreeNode *)aChild;
-(void)insertRightNode:(BinaryTreeNode *)parent child:(BinaryTreeNode *)aChild;
-(void)remove:(BinaryTreeNode *)node;


@end
