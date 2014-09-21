//
//  MLDemo.m
//  demo_instancetype类型
//
//  Created by Lwgfangz on 14-7-26.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "MLDemo.h"

@implementation MLDemo


+(id)alloc
{
    return [self shareInstance];
}

-(id)init
{
    self = [super init];
    if(self)
    {
    }
    return self;
}
+ (id)hiddenAlloc
{
    return [super alloc];
}
+(id)shareInstance
{
    static MLDemo *instance = nil;
    static dispatch_once_t onceToken;
    NSLog(@"asdf");
    dispatch_once(&onceToken,
        ^{

        instance = [[super alloc] init];
        NSLog(@"单例的地址: %@", instance);
        //[NSThread sleepForTimeInterval:2];

    });
    return instance;//放在外面哦

}

@end
