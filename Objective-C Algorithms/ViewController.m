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
#import "Utils.h"
#import "Graph.h"
#import "Node.h"
#import "Edge.h"

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
    
    [self testGraph];
    
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
    NSLog(@"Quicksort test");
    Quicksort *q = [[Quicksort alloc] init];
    NSMutableArray *test = [Utils getRandomizedArray];
    NSLog(@"%@", test);
    test = [q quicksort:test];
    NSLog(@"%@", test);
    
    
}

-(void)testMergesort
{
    Mergesort *sort = [[Mergesort alloc] init];
    [sort test];
    
    
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
