//
//  BinaryTreeNode.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/14/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTNode : NSObject
{
    
}

@property (nonatomic, strong) BTNode *parent;
@property (nonatomic, strong) BTNode *left;
@property (nonatomic, strong) BTNode *right;
@property (assign) NSUInteger value;
@property (assign) NSUInteger level;

-(void)insert:(BTNode *)node;
-(void)insertLeftNode:(BTNode *)parent child:(BTNode *)aChild;
-(void)insertRightNode:(BTNode *)parent child:(BTNode *)aChild;
-(void)remove:(BTNode *)node;


@end
