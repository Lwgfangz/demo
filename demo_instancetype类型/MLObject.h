//
//  MLObject.h
//  demo_instancetype类型
//
//  Created by Lwgfangz on 14-7-26.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//
#define BUFFER_LEN 1024*1024*50ll
#import <Foundation/Foundation.h>

@interface MLObject : NSObject
{
    unsigned char buffer[BUFFER_LEN];
}
@end
