//
//  MaxPathTests.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/30/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MaxPath.h"

@interface MaxPathTests : XCTestCase

@end

@implementation MaxPathTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testMaxPath {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        
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
        
        XCTAssert(maxp == 34);
        
    }];
}

@end
