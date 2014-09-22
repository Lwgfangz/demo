//
//  largerObjct.m
//  demo_leak
//
//  Created by Lwgfangz on 14-7-23.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "largerObjct.h"
#define BUFFER_LEN (1024*1024*50ul)
@interface largerObjct()
{
    unsigned char *pBuffer;
}
@end
@implementation largerObjct
-(id)init
{
    self = [super init];
    if(self)
    {
        pBuffer = (unsigned char *)malloc(BUFFER_LEN);
        memset(pBuffer, 0, BUFFER_LEN);
        /*
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^()
        {
            for(int i = 0;i<BUFFER_LEN;i++)
            {
                pBuffer[i]=0;
            }
        });
         */
    }
    return self;
}
-(void)dealloc
{
    free(pBuffer);
    [super dealloc];
}
@end
