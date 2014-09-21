//
//  MLViewController.m
//  demo_block_buffer
//
//  Created by Lwgfangz on 14-7-19.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    char a[]="abcdef";
    char *p1 = a;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^()
    {

        printf("2  %s\n",p1);
    });
    //printf("====%s\n",p1);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
