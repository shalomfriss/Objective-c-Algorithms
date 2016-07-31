//
//  FibonacciNumbersTests.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/31/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FibonacciNumbers.h"

@interface FibonacciNumbersTests : XCTestCase

@end

@implementation FibonacciNumbersTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testFiboNumbers
{
    
    FibonacciNumbers *fn = [[FibonacciNumbers alloc] init];
    NSUInteger fibs[20];
    fibs[0] = 	1;
    fibs[1] = 	1;
    fibs[2] = 	2;
    fibs[3] = 	3;
    fibs[4] = 	5;
    fibs[5] = 	8;
    fibs[6] = 	13;
    fibs[7] = 	21;
    fibs[8] = 	34;
    fibs[9] = 	55;
    fibs[10] = 	89;
    fibs[11] = 	144;
    fibs[12] = 	233;
    fibs[13] = 	377;
    fibs[14] = 	610;
    fibs[15] = 	987;
    fibs[16] = 	1597;
    fibs[17] = 	2584;
    fibs[18] = 	4181;
    fibs[19] = 	6765;
    
    for(NSUInteger i = 0; i < sizeof(fibs)/sizeof(NSUInteger); i++)
    {
        if(fibs[i] != [fn nthFibo:i])
        {
            XCTAssert(NO);
        }
    }
    
    
    
    XCTAssert(YES);
    
    
    
}

@end
