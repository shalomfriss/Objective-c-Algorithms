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
    
    NSUInteger F1 = 1;
    NSUInteger F2 = 1;
    NSUInteger temp;
    
    for(NSInteger i = 2; i <= fibo; i++)
    {
        temp = F1 + F2;
        F1 = F2;
        F2 = temp;
        
    }
    return F2;
}

@end
