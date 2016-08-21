//
//  QueueTests.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/16/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Queue.h"

@interface QueueTests : XCTestCase

@end

@implementation QueueTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        
        Queue *s = [[Queue alloc] init];
        [s push:[NSNumber numberWithInteger:1]];
        [s push:[NSNumber numberWithInteger:2]];
        [s push:[NSNumber numberWithInteger:3]];
        
        NSUInteger el = [(NSNumber *)[s pop] integerValue];
        XCTAssert(el == 1);
        
        [s push:[NSNumber numberWithInteger:9]];
        el = [(NSNumber *)[s pop] integerValue];
        XCTAssert(el == 2);
        
        el = [(NSNumber *)[s pop] integerValue];
        XCTAssert(el == 3);
        
        XCTAssert([s hasItems] == YES);
        el = [(NSNumber *)[s pop] integerValue];
        XCTAssert([s hasItems] == NO);
        
        [s push:[NSNumber numberWithInteger:9]];
        XCTAssert([s hasItems] == YES);
        el = [(NSNumber *)[s pop] integerValue];
        XCTAssert(el == 9);
        
        [s reset];
        XCTAssert([s hasItems] == NO);
        
        
    }];
}

@end
