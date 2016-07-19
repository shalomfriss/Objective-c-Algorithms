#import <Foundation/Foundation.h>

@interface Heap : NSObject
{
    NSMutableArray *objects;
    int count;
}

-(void)insert:(NSNumber *)item;
-(void)printme;
-(NSNumber *)removeMin;

@property (nonatomic, retain) NSMutableArray *heap;



@end

