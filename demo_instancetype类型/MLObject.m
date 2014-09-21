//
//  MLObject.m
//  demo_instancetype类型
//
//  Created by Lwgfangz on 14-7-26.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "MLObject.h"

@implementation MLObject
//重写alloc
//+(id)alloc
//{
//    return [super alloc];
//}
-(id)init
{
    if(self = [super init])
    {
        memset(buffer, 0, BUFFER_LEN);
    }
    return self;
}
@end
