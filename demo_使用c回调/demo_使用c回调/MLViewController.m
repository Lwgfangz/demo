//
//  MLViewController.m
//  demo_使用c回调
//
//  Created by Lwgfangz on 14-7-19.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//




#import "MLViewController.h"

#import "MLLargeObject.h"
typedef  void (*CallBack)(MLLargeObject *param,void *lpUserData);



void fun(CallBack cb,void *lpUserData)
{
    for(int i = 0;i<10;i++)
    {
        @autoreleasepool
        {
            if(cb!=NULL)
            {
                cb([MLLargeObject new],lpUserData);
            }
        }
    }
}



void callback(MLLargeObject *param,void *lpUserData)
{
    MLViewController *controller = (__bridge MLViewController *)lpUserData;
    [controller callback:param];

}




@interface MLViewController ()
{
    unsigned char *buffer;
}

@end

@implementation MLViewController

- (IBAction)action:(id)sender
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^()
    {
        for(int i = 0;i<1000000000;i++)
        {
            fun(callback, (__bridge void*)self);
        }


        //CFRelease((__bridge void*) self);
    });

}

- (void)viewDidLoad
{
    buffer = NULL;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action1:(id)sender
{
    if(buffer)
    {
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^()
                   {
                       unsigned  long len =1024*1024 *500ul;
                       buffer = malloc(len);
                       for(unsigned long i = 0;i<len;i++)
                       {
                           buffer[i]=0;
                       }
                       NSLog(@"=====complete");
                   });

}
- (IBAction)actiong2:(id)sender
{
    if(buffer)
    {
        free(buffer);
        buffer = NULL;
    }
}

-(void)callback:(MLLargeObject *)param
{
    //NSLog(@"param = %@",param);
}
@end
