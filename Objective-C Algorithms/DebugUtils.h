//
//  DebugUtils.h
//  FieldOps
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 2/29/16.
//  Copyright © 2016 Justin Blunk. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifdef DEBUG_MODE
    #ifdef DEBUG_VERBOSE
        #ifdef DEBUG_CLASS_AND_LINE_NUMBER_ONLY
            #define trace(msg, ...) NSLog((@"%@:%d - " msg),  NSStringFromClass(self.class), __LINE__, ##__VA_ARGS__)
        #endif
        #ifndef DEBUG_CLASS_AND_LINE_NUMBER_ONLY
            #define trace(msg, ...) NSLog((@"%s:%d - " msg),  __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
        #endif

    #endif
    #ifndef DEBUG_VERBOSE
        #define trace(msg, ...) NSLog(@msg, ##__VA_ARGS__)
    #endif
#else
#define trace(msg, ...) YES
#endif


@interface DebugUtils : NSObject
{
    
}
+(DebugUtils *)getInstance;


@end


