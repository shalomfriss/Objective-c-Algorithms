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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testMergesort];
    
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
