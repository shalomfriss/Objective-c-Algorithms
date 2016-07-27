#import <Foundation/Foundation.h>

@interface Heap : NSObject
{
    NSMutableArray *objects;
    int count;
}

-(void)insert:(NSNumber *)item;
-(NSNumber *)removeMin;

@property (nonatomic, retain) NSMutableArray *heap;



@end

