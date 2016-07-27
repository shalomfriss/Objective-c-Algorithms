//
//  SelectionSortTests.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/27/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SelectionSort.h"
#import "Utils.h"

@interface SelectionSortTests : XCTestCase

@end

@implementation SelectionSortTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testSelectionSort
{
    
    SelectionSort *sort = [[SelectionSort alloc] init];
    NSMutableArray *items = [Utils getRandomizedArray];
    
    
    
    __block NSMutableArray *sorted;
    [self measureBlock:^{
        sorted = [sort sort:items];
    }];
    
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
    
    for(NSUInteger i = 0; i < sorted.count - 1; i++)
    {
        if(sorted[i] > sorted[i + 1])
        {
            XCTAssertTrue(NO);
        }
    }
    
    XCTAssert(YES);
    
}


@end
