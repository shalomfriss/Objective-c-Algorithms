//
//  ShellSort.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 7/27/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "ShellSort.h"

@implementation ShellSort

-(NSMutableArray *)sort:(NSMutableArray *)items
{
    NSMutableArray *copy = [items mutableCopy];
    NSInteger h;
    for(h = 0; h < copy.count/9; h = h * 3 + 1);
    for(; h > 0; h /= 3)
    {
        for(NSInteger i = h; i < copy.count; i++)
        {
            NSInteger j = i;
            while(j > 0)
            {
                if(copy[j] < copy[j - 1])
                {
                    id temp = copy[j];
                    copy[j] = copy[j - 1];
                    copy[j - 1] = temp;
                }
                j--;
            }
            
        }
    }
    
    
    return copy;
}

@end
