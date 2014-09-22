//
//  ViewController.m
//  demo_leak
//
//  Created by Lwgfangz on 14-7-23.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "ViewController.h"
#import "largerObjct.h"
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
    [[largerObjct alloc]init];
}
- (IBAction)actionFree:(id)sender
{
    [[[largerObjct alloc]init] autorelease] ;
    //[[[UIImage alloc]init] autorelease] ;
    //[[UIImage alloc]init] ;
}

@end
