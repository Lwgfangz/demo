//
//  TPMSViewController.m
//  demo_gcd_group
//
//  Created by Lwgfangz on 14-7-29.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "TPMSViewController.h"

typedef void (^COMPLETE)(id obj,NSError *error);

@interface TPMSViewController ()
{
}
@property(nonatomic,strong)dispatch_queue_t workQueue;
@end

@implementation TPMSViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [self works];
    [self works];
}


-(void)works
{
    
    dispatch_group_t  group = dispatch_group_create();
    for(int i =0;i<10;i++)
    {
        dispatch_group_enter(group);

        [self work:^(id obj,NSError *errir)
         {
                dispatch_group_leave(group);
            }];
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^()
    {
        NSLog(@"下载全部完成!!!");
    });
}

-(void)work:(COMPLETE)complete
{
    if(_workQueue == nil)
    {
        _workQueue = dispatch_queue_create("aaa", 0);
    }
    dispatch_async(_workQueue, ^()
    {
        NSDate *date = [NSDate date];
        double time = [date timeIntervalSince1970];
        
        NSLog(@"开始工作 %f",time);
        sleep(1);
        NSLog(@"工作完成 %f",time);
        dispatch_async(dispatch_get_main_queue(), ^()
        {
            if(complete)complete(@YES,nil);
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
