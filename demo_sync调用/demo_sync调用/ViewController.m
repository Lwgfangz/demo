//
//  ViewController.m
//  demo_sync调用
//
//  Created by Lwgfangz on 14-7-4.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "ViewController.h"
void fun();
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"====0");
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^()
    {
        [self fun:^()
         {
             NSLog(@"====1");
         }];
    });

    NSLog(@"====2");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//异步函数
-(void)fun:(void (^)())success
{
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^()
    {
        sleep(10);
        dispatch_async(dispatch_get_main_queue(), ^()
        {
            if(success)success();
        });
    });
}


@end

