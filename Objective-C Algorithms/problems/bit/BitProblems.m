//
//  BitProblems.m
//  Objective-C Algorithms
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 8/20/16.
//  Copyright © 2016 FRISS, SHALOM [AG-Contractor/1005]. All rights reserved.
//

#import "BitProblems.h"
#import "BitUtils.h";

@implementation BitProblems


/*
 *This problem seems to be ill explained
 Insertion: You are given two 32-bit numbers, N and M, and two bit positions, i and j. Write a method to insert M into N such that M starts at bit j and ends at bit i. You can assume that the bits j through i have enough space to  t all of M. That is, if M = 10011, you can assume that there are at least 5 bits between j and i. You would not,  r example, have j = 3 and i = 2, because M could not fully  t between bit 3 and bit 2.
 EXAMPLE
 Input: N   10000000000, M 10011, i 2, j 6 Output:N = 10001001100
 */
-(NSUInteger)insertBit:(NSUInteger)N M:(NSUInteger)aM i:(NSUInteger)ai j:(NSUInteger)aj
{
    [BitUtils printBinary:N];
    [BitUtils printBinary:aM];
    
    NSUInteger num1 = aM;
    NSUInteger count = 0;
    while(num1 != 0)
    {
        num1 >>= 1;
        count++;
    }
   
    
    //Create a string of 5 1's
    NSUInteger clearMask = (1 << (count)) - 1;
    //Shift it over so it starts from j and end at i or less
    clearMask <<= (aj - count);
    [BitUtils printBinary:clearMask];
    
    //Flip the bits so it clears with an XOR
    clearMask = ~clearMask;
    
    
    [BitUtils printBinary:clearMask];
    
    
    NSUInteger num2 = aM << ai; //or starting at j and counting backwards... not sure what they meant (aj - count);
    [BitUtils printBinary:num2];
    
    num1 = N & clearMask;
    [BitUtils printBinary:num1];
    
    num1 = num1 | num2;
    return num1;
    
    
}



/*
 Binary to String: Given a real number between O and 1 (e.g., 0.72) that is passed in as a double, print the binary representation. If the number cannot be represented accurately in binary with at most 32 characters, print "ERROR:'
 */
-(void)printBinaryFractionToString:(float)num
{
    
    NSMutableSet *s = [[NSMutableSet alloc] init];
    //NSNumber *res = [NSNumber numberWithUnsignedInteger:num];
    //[s addObject:res];
    
    double temp = num;
    
    NSMutableString *str = [NSMutableString stringWithFormat:@"0."];
    
    while(temp > 0)
    {
        //res = [NSNumber numberWithFloat:][res floatValue] * 2;
        temp = temp * 2;
        if(temp >= 1)
        {
            [str appendString: @"1"];
            temp = temp - 1;
        }
        else{
            [str appendString: @"0"];
            temp = temp;
        }
       
        if([str length] > 32)
        {
            NSLog(@"ERROR");
            break;
        }
    }
    
    //if(res > 0)
    
    NSLog(@"%@", str);
    
}

/*
 Flip Bit to Win: You have an integer and you can flip exactly one bit from a 0 to a 1. Write code to find the length of the longest sequence of ls you could create.
 
 EXAMPLE
 Input: 1775 (or: 11011101111) Output: 8
 */
-(void)flipBit:(NSUInteger)num
{
    
    //Create an array of bits
    NSMutableArray<NSNumber *> * arr = [[NSMutableArray<NSNumber *> alloc] init];
    while(num > 0)
    {
        NSUInteger bit = num & 1;
        [arr addObject:[NSNumber numberWithUnsignedInteger:bit]];
        num >>= 1;
    }
    
    //set each bit to 1 and check for consecutives
    NSNumber *old;
    NSUInteger sum = 0;
    NSUInteger max = 0;
    NSUInteger index = 0;
    for(NSUInteger i = 0; i < arr.count; i++)
    {
        old = [arr objectAtIndex:i];
        [arr setObject:[NSNumber numberWithUnsignedInteger:1] atIndexedSubscript:i];
        
        sum = 0;
        for(NSUInteger j = 0; j < arr.count; j++)
        {
            if([[arr objectAtIndex:j] unsignedIntegerValue]  == 1)
            {
                sum++;
            }
            else
            {
                if(sum > max)
                {
                    max = sum;
                    index = i;
                }
                sum = 0;
            }
           
        }
        [arr setObject:old atIndexedSubscript:i];
    }
    
    NSLog(@"index: %lu", index);
    
    
}

/*
 Given a positive integer, print the next smallest and the next largest number that have the same number of 1 bits in their binary representation.
 */
-(void)printNextSmallestAndLargest:(NSUInteger)num
{
    //To solve this, for the next smallest we unset the lowest bit then set bit closes to that one
    //for the largest we unset the largest bit and set the one closest to that one
   

    NSUInteger count = 0;
    NSUInteger temp = num;
    while(temp > 0)
    {
        temp >>= 1;
        count++;
    }
    
    temp = num;
    
    //Find the largest and smallest indices containing a 1
    //Also find two instances for the zeros, this is so that we can do
    //everything in one loop
    NSUInteger smallIndex = 0;
    NSUInteger largeIndex = 0;
    NSUInteger smallZeroIndex1 = 0;
    NSUInteger smallZeroIndex2 = 0;
    NSUInteger smallZeroIndex = 0;
    
    NSUInteger largeZeroIndex1 = 0;
    NSUInteger largeZeroIndex2 = 0;
    NSUInteger largeZeroIndex = 0;

    BOOL smallZero1Found = NO;
    BOOL smallZero2Found = NO;
    
    BOOL smallIndexFound = NO;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSUInteger bit = ((1 << i) & temp);
        if(bit > 0)
        {
            //Found the smallest 1, now set it to 0 and break
            
            if(smallIndexFound == NO)
            {
                smallIndexFound = YES;
                smallIndex = i;
            }
            
            //By the end of the loop this will be the largest index
            largeIndex = i;
            
        }
        else
        {
            
            if(smallZero1Found == NO)
            {
                smallZero1Found = YES;
                smallZeroIndex1 = i;
            }
            else if (smallZero2Found == NO)
            {
                smallZero2Found = YES;
                smallZeroIndex2 = i;
            }
            
            largeZeroIndex2 = largeZeroIndex1;
            largeZeroIndex1 = i;
            
        }
        
    }
    
    //Make sure we get a zero that isn't at the same location as the bit we set to zero
    smallZeroIndex = smallZeroIndex1 != smallIndex ? smallZeroIndex1 : smallZeroIndex2;
    largeZeroIndex = largeZeroIndex1 != largeIndex ? largeZeroIndex1 : largeZeroIndex2;
    
    //Set the smallest 1 and largest 1 to zero
    NSUInteger temp1 = num;
    NSUInteger temp2 = num;
    temp1 = temp1 & ~(1 << smallIndex);
    temp2 = temp2 & ~(1 << largeIndex);
   
    
    temp1 = temp1 | (1 << smallZeroIndex);      //The next smallest with the same bits
    temp2 = temp2 | (1 << largeZeroIndex);      //The next largest with the same bits
    
    
}
@end
