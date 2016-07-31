//
//  FibonacciNumbers.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/31/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "FibonacciNumbers.h"

@implementation FibonacciNumbers

-(NSUInteger)nthFibo:(NSUInteger)fibo
{
    if(fibo < 1)
    {
        return 1;
    }
    if(fibo == 1)
    {
        return 1;
    }
    
    return [self nthFibo:fibo - 1] + [self nthFibo:fibo - 2];
}

@end
