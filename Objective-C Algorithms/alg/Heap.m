#import "Heap.h"

@implementation Heap

-(id)init
{
    if(self = [super init])
    {
        self.heap = [[NSMutableArray alloc] init];
        self.heap[0] = [NSNumber numberWithInteger:-1];
        count = 0;
    }
    
    return self;
}

-(void)insert:(NSNumber *)num
{
    [self.heap insertObject:num atIndex:count + 1];
    count++;
    
    if(count ==  1)
    {
        return;
    }
    
    for(NSUInteger i = count; num < self.heap[(int)(floor(i/2))]; i = floor(i/2))
    {
        [self.heap exchangeObjectAtIndex:i withObjectAtIndex:(int)(floor(i/2))];
    }
    
}



-(NSNumber *)removeMin
{
    NSNumber *min = self.heap[1];
    NSNumber *last = self.heap[count];
    self.heap[1] = last;
    
    [self.heap removeObjectAtIndex:count];
    count--;
    
    NSUInteger minIndex;
    for(NSUInteger i = 1; min > self.heap[i*2]; i = i*2)
    {
        //[self.heap exchangeObjectAtIndex:i-1 withObjectAtIndex:(i*2 - 1)];
        
        if(i * 2 > count)
        {
            return min;
        }
        
        minIndex = i;
        if(self.heap[minIndex] > self.heap[i*2])
        {
            minIndex = i*2;
        }
        
        if(self.heap[minIndex] > self.heap[i*2 + 1])
        {
            minIndex = i*2 + 1;
        }
        
        if(minIndex != i)
        {
            NSNumber *temp = self.heap[i];
            self.heap[i] = self.heap[minIndex];
            self.heap[minIndex] = temp;
        }
        
        
    }
    
    return min;
}


-(void)swapper:(int)index1 index2:(int)ind2
{
    NSNumber *temp;
    temp = self.heap[index1];
    self.heap[index1] = self.heap[ind2];
    self.heap[ind2] = temp;
}



@end
