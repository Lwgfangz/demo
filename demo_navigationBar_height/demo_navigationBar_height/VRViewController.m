//
//  VRViewController.m
//  demo_navigationBar_height
//
//  Created by Lwgfangz on 14-9-15.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "VRViewController.h"

@interface VRViewController ()

@end

@implementation VRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavBarHeight];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self setNavBarHeight];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setNavBarHeight
{
    CGRect rect = self.navigationController.navigationBar.frame;
    self.navigationController.navigationBar.frame = CGRectMake(rect.origin.x,rect.origin.y,rect.size.width,184);
    
}
@end
