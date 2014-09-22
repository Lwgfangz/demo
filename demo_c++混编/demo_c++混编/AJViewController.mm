//
//  AJViewController.m
//  demo_c++混编
//
//  Created by Lwgfangz on 14-8-29.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "AJViewController.h"
#import "File.h"
@interface AJViewController ()

@end

@implementation AJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    fun();
    
    person person;
    person.fun();
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
