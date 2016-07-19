//
//  MergesortTests.m
//  FBTest
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/19/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Mergesort.h"

@interface MergesortTests : XCTestCase

@end

@implementation MergesortTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testMergesortReturnsSameElementsInArray
{
    Mergesort *sort = [[Mergesort alloc] init];
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    for(NSUInteger i = 0; i < 515; i += 7)
    {
        [items addObject:[NSNumber numberWithInteger:i]];
    }
    
    NSArray *sorted = [sort mergesort:[items copy]];
    
    if(sorted.count != items.count)
    {
        XCTAssertTrue(NO);
    }
    for(NSUInteger i = 0; i < items.count; i++)
    {
        if(![sorted containsObject:items[i]])
        {
            XCTAssertTrue(NO);
        }
    }
    
    XCTAssert(YES);
}

-(void)testMergesortReturnsSortedArray
{
    Mergesort *sort = [[Mergesort alloc] init];
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    for(NSUInteger i = 0; i < 515; i += 7)
    {
        [items addObject:[NSNumber numberWithInteger:i]];
    }
    
    NSArray *sorted = [sort mergesort:[items copy]];
    for(NSUInteger i = 0; i < sorted.count - 1; i++)
    {
        if(sorted[i] > sorted[i + 1])
        {
            XCTAssertTrue(NO);
        }
    }
}



- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
