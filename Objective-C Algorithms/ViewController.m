//
//  ViewController.m
//  FBTest
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/15/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "ViewController.h"
#import "Heap.h"
#import "Mergesort.h"
#import "Quicksort.h"
#import "SelectionSort.h"
#import "Utils.h"
#import "Graph.h"
#import "Node.h"
#import "Edge.h"
#import "BitUtils.h"
#import "MaxPath.h"
#import "TreeBalanceCheck.h"
#import "GNode.h"
#import "GGraph.h"
#import "PathExistenceInDirectedGraph.h"

#define mut(aname) NSMutableArray *aname = [[NSMutableArray alloc] init];
/*
 mut(asdf);
 [asdf addObject:@"TEST"];
 NSLog(@"WHAT");
 NSLog(@"%@", asdf);
 */



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self testGraph];
    //[self testBit];
    //[self testQuicksort];
    //[self testSelectionSort];
    //[self testBitUtils];
    //[self testMaxPath];
    //[self testTreeBalance];
    [self testPathExists];
}

-(void)testPathExists
{
    NSMutableArray<GNode *> *nodes = [[NSMutableArray<GNode *> alloc] init];
    for(NSUInteger i = 0; i < 30; i++)
    {
        GNode *node = [[GNode alloc] init];
        [nodes addObject:node];
    }
    
    [[nodes objectAtIndex:0].adjacentNodes addObject:[nodes objectAtIndex:1]];
    [[nodes objectAtIndex:0].adjacentNodes addObject:[nodes objectAtIndex:2]];

    [[nodes objectAtIndex:1].adjacentNodes addObject:[nodes objectAtIndex:3]];
    [[nodes objectAtIndex:1].adjacentNodes addObject:[nodes objectAtIndex:4]];
    [[nodes objectAtIndex:1].adjacentNodes addObject:[nodes objectAtIndex:5]];
    
    [[nodes objectAtIndex:2].adjacentNodes addObject:[nodes objectAtIndex:6]];
    [[nodes objectAtIndex:2].adjacentNodes addObject:[nodes objectAtIndex:7]];
    
    [[nodes objectAtIndex:3].adjacentNodes addObject:[nodes objectAtIndex:8]];
    [[nodes objectAtIndex:3].adjacentNodes addObject:[nodes objectAtIndex:9]];
    [[nodes objectAtIndex:3].adjacentNodes addObject:[nodes objectAtIndex:10]];
    [[nodes objectAtIndex:3].adjacentNodes addObject:[nodes objectAtIndex:11]];
    
    [[nodes objectAtIndex:11].adjacentNodes addObject:[nodes objectAtIndex:3]];
    PathExistenceInDirectedGraph *g = [[PathExistenceInDirectedGraph alloc] init];
    BOOL ex = [g pathExists:[nodes objectAtIndex:3] node2:[nodes objectAtIndex:19]];
    if(ex == YES)
    {
        NSLog(@"YES");
    }
    else{
        NSLog(@"NO");
    }
}

-(void)testTreeBalance
{
    NSLog(@"Tree balance check");
    NSMutableArray<NSNumber *> *items = [[NSMutableArray<NSNumber *> alloc] init];
    items[0] = [NSNumber numberWithInteger:1];
    
    items[1] = [NSNumber numberWithInteger:2];
    items[2] = [NSNumber numberWithInteger:3];
    
    items[3] = [NSNumber numberWithInteger:4];
    items[4] = [NSNumber numberWithInteger:-1];
    items[5] = [NSNumber numberWithInteger:10];
    items[6] = [NSNumber numberWithInteger:7];
    
    items[7] = [NSNumber numberWithInteger:7];
    items[8] = [NSNumber numberWithInteger:7];
    items[9] = [NSNumber numberWithInteger:7];
    items[10] = [NSNumber numberWithInteger:7];
    items[11] = [NSNumber numberWithInteger:2];
    items[12] = [NSNumber numberWithInteger:11];
    items[13] = [NSNumber numberWithInteger:7];
    items[14] = [NSNumber numberWithInteger:7];
    
    TreeBalanceCheck *c = [[TreeBalanceCheck alloc] init];
    BOOL bal = [c isBalanced:items];
    if(bal == YES)
    {
        NSLog(@"YES");
    }
    else{
        NSLog(@"NO");
    }
    
}

-(void)testMaxPath
{
    //NSMutableArray<NSNumber *> *items = [Utils getRandomizedBinaryTree:5];
    //[Utils printBinaryTree:items];
    
    NSMutableArray<NSNumber *> *items = [[NSMutableArray<NSNumber *> alloc] init];
    items[0] = [NSNumber numberWithInteger:1];
    
    items[1] = [NSNumber numberWithInteger:2];
    items[2] = [NSNumber numberWithInteger:3];
    
    items[3] = [NSNumber numberWithInteger:4];
    items[4] = [NSNumber numberWithInteger:19];
    items[5] = [NSNumber numberWithInteger:10];
    items[6] = [NSNumber numberWithInteger:7];
    
    items[7] = [NSNumber numberWithInteger:7];
    items[8] = [NSNumber numberWithInteger:7];
    items[9] = [NSNumber numberWithInteger:7];
    items[10] = [NSNumber numberWithInteger:7];
    items[11] = [NSNumber numberWithInteger:10];
    items[12] = [NSNumber numberWithInteger:11];
    items[13] = [NSNumber numberWithInteger:7];
    items[14] = [NSNumber numberWithInteger:7];
    
    
    MaxPath *p = [[MaxPath alloc] init];
    NSUInteger maxp = [p findMax:items];
    NSLog(@"%lu", maxp);
    
    /*
    for(NSUInteger i = 0; i < items.count; i++)
    {
        NSNumber *num = items[i];
        NSLog(@"-> %ld", (long)[num integerValue]);
    }
    */
}

-(void)testBitUtils
{
    
    NSMutableArray *shouldEqualToThis = [@[@1, @1, @0, @1, @0, @0, @1] mutableCopy];
    
    __block NSMutableArray *bits;
    
    bits = [BitUtils convertToBinary:105];
    NSLog(@"%@", bits);
    
    [BitUtils echo:bits];
    [BitUtils echo: shouldEqualToThis];
    
    
    for(NSInteger i = 0; i < bits.count; i++)
    {
        NSLog(@"%@ - %@", [bits[i] class], shouldEqualToThis[i]);
        
        if([bits[i] integerValue] != [shouldEqualToThis[i] integerValue])
        {
            //NSLog(@"NOT EQ: %lu - %lu", bits[i], shouldEqualToThis[i]);
        }
    }
    
    
}


-(void)testSelectionSort
{
    NSLog(@"Testing Selection sort");
    
    SelectionSort *sort = [[SelectionSort alloc] init];
    NSMutableArray *test = [Utils getRandomizedArray];
    NSMutableArray *sorted = [sort sort:test];
    
    NSLog(@"%@", test);
    NSLog(@"%@", sorted);
    
    if(sorted.count != test.count)
    {
        //XCTAssertTrue(NO);
        NSLog(@"BAD");
        /*
        NSLog(@"%@", test);
        NSLog(@"%@", sorted);
        NSLog(@"%lu - %lu", test.count, sorted.count);
         */
    }
    //NSLog(@"%lu - %lu", test.count, sorted.count);
    
    for(NSUInteger i = 1; i < sorted.count; i++)
    {
        if(sorted[i - 1] > sorted[i])
        {
            NSLog(@"%lu - %lu", i - 1, i);
            NSLog(@"%@ - %@", sorted[i - 1], sorted[i]);
        }
    }
    
}

-(void)testBit
{
    
    
    
    NSMutableArray *res = [BitUtils convertToBinary: 14];
    NSMutableArray *res2 = [BitUtils convertToBinary: 32];
    NSMutableArray *res3 = [BitUtils convertToBinary: 71];
    NSMutableArray *res4 = [BitUtils convertToBinary: 121];
    NSInteger num = [BitUtils convertToDecimal:res];
    NSInteger num2 = [BitUtils convertToDecimal:res2];
    NSInteger num3 = [BitUtils convertToDecimal:res3];
    NSInteger num4 = [BitUtils convertToDecimal:res4];
    
    NSLog(@"NUM: %lu", num);
    NSLog(@"NUM: %lu", num2);
    NSLog(@"NUM: %lu", num3);
    NSLog(@"NUM: %lu", num4);
    
}

-(void)testGraph
{
    trace("testing");
    Graph *g = [[Graph alloc] init];
    trace("Made graph");
    [g generateRandom:7];
    //[g show];
    
    Node *node = [[Node alloc] init];
    node.value = 202;
    [g BFS:g root:nil nodeToFind:node];
}

-(void)testQuicksort
{
    
    Quicksort *sort = [[Quicksort alloc] init];
    NSMutableArray *test = [Utils getRandomizedArray];
    
    NSMutableArray *sorted = [sort sort:test];;
    
    NSLog(@"%@", sorted);
    NSLog(@"%@", test);
    if(sorted.count != test.count)
    {
        //XCTAssertTrue(NO);
        NSLog(@"%@", test);
        NSLog(@"%@", sorted);
        NSLog(@"%lu - %lu", test.count, sorted.count);
    }
    
    
}

-(void)testMergesort
{
    //Mergesort *sort = [[Mergesort alloc] init];
    
    
}

-(void)testHeapsort
{
    Heap *h = [[Heap alloc] init];
    for(int i = 0; i < 500; i += 27)
    {
        [h insert:[NSNumber numberWithInteger:i]];
    }
    
    [h insert:[NSNumber numberWithInteger:55]];
    [h insert:[NSNumber numberWithInteger:255]];
    
    NSLog(@"%@", h.heap);
    
    
    NSNumber *min = [h removeMin];
    NSLog(@"%@", min);
    
    min = [h removeMin];
    NSLog(@"%@", min);
    min = [h removeMin];
    NSLog(@"%@", min);
    min = [h removeMin];
    NSLog(@"%@", min);
    
    //NSLog(@"%@", h.heap);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
