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
    [self testMaxPath];
}

-(void)testMaxPath
{
    NSMutableArray<NSNumber *> *items = [Utils getRandomizedBinaryTree:4];
    
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
