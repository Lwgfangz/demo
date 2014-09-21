//
//  MLViewController.m
//  demo_保留
//
//  Created by Lwgfangz on 14-7-13.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "MLViewController.h"
#import "MLDemo.h"
@interface MLViewController ()
{
    UIView *demo;
}
@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   demo = [UIView new];
    UIView *newDemo = [demo copy];
    NSLog(@"%X",&newDemo);
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)action:(id)sender {
   // NSLog(@"%d",demo.a);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
