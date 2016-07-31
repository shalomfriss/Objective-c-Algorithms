//
//  BitUtilsTests.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/27/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BitUtils.h"

@interface BitUtilsTests : XCTestCase

@end

@implementation BitUtilsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConvertToBinary {
    
    NSMutableArray *shouldEqualToThis = [@[@1, @1, @0, @1, @0, @0, @1] mutableCopy];
    
    __block NSMutableArray *bits;
    [self measureBlock:^{
        bits = [BitUtils convertToBinary:105];
        for(NSInteger i = 0; i < bits.count; i++)
        {
            if([bits[i] integerValue] != [shouldEqualToThis[i] integerValue])
            {
                XCTAssert(NO);
            }
        }
    }];
    
    XCTAssert(YES);
    
}



-(void)testConvertToDecimal
{
    NSMutableArray *bitArray = [@[@1, @1, @0, @1, @0, @0, @1] mutableCopy];
    NSInteger shouldEqual = 105;
    __block NSInteger val;
    [self measureBlock:^{
        val = [BitUtils convertToDecimal:bitArray];
    }];
    
    if(val != shouldEqual)
    {
        XCTAssert(NO);
    }
    
    XCTAssert(YES);
}

@end
