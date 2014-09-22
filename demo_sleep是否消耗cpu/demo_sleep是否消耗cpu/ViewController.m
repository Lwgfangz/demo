//
//  ViewController.m
//  demo_sleep是否消耗cpu
//
//  Created by Lwgfangz on 14-7-25.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)action:(id)sender
{
    NSLog(@"开始睡觉");
    sleep(10);
    NSLog(@"睡觉玩了");
}

@end
