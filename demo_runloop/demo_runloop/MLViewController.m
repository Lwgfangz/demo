//
//  MLViewController.m
//  demo_runloop
//
//  Created by Lwgfangz on 14-6-29.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()
{
    BOOL end;
}

@end

@implementation MLViewController


-(void)viewDidAppear:(BOOL)animated
{
    [NSThread detachNewThreadSelector:@selector(downloadBeatifulGirl) toTarget:self withObject:nil];
//    while (!end)
//    {
//        NSLog(@"等待下载美女完成...");
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
//        NSLog(@"遍历完一个输入源队列");
//
//    }

}
-(void)downloadBeatifulGirl
{
    NSLog(@"开始下载美女");
    sleep(5);
    NSLog(@"下载美女完成");
    [self performSelectorOnMainThread:@selector(setEnd) withObject:nil waitUntilDone:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)action:(id)sender {
    NSLog(@"处理事件源...");
    NSLog(@"取消下载");
}

-(void)setEnd{
        NSLog(@"显示美女");
}

@end
