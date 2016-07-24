//
//  DebugUtils.m
//  FieldOps
//
//  Created by FRISS, SHALOM [AG-Contractor/1005] on 2/29/16.
//  Copyright © 2016 Justin Blunk. All rights reserved.
//

#import "DebugUtils.h"

@implementation DebugUtils

static DebugUtils *_instance = nil;
+(DebugUtils *)getInstance
{
    if(_instance == nil)
    {
        _instance = [[DebugUtils alloc] init];
    }
    
    return _instance;
}


@end

