//
//  TreeGraphProblems.h
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/21/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Graph.h"
#import "BinaryTree.h"

@interface TreeGraphProblems : NSObject
{
    
}

-(void)minimalTree:(NSMutableArray *)items;
-(NSMutableArray *)createDepthLists:(BinaryTree *)tree;
-(BOOL)checkBalanced:(BinaryTree *)tree;


@end
