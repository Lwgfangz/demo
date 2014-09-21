//
//  MLDemo.m
//  demo_保留
//
//  Created by Lwgfangz on 14-7-13.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "MLDemo.h"

@implementation MLDemo
{
}

-(id)init
{
    NSLog(@"demo init");
    if(self = [super init])
    {
        _a = 1000;
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"%@ dealloc",self);
    //[super dealloc];
}
@end
