//
//  DMViewController.m
//  demo_ 自动布局
//
//  Created by Lwgfangz on 14-9-20.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "DMViewController.h"
#import "UIView+autolayoutView.h"
#import "ALBottomSteelWire.h"
#import "ALVPin.h"
@interface DMViewController ()

@end

@implementation DMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self demo];

    /*

    UIView *view = [UIView new];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    view.backgroundColor = [UIColor yellowColor];
    self.view = view;


    UIView *view1 = [UIView new];
    [view1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    view1.backgroundColor = [UIColor greenColor];
    [view addSubview:view1];



     NSArray *c0 =      [NSLayoutConstraint constraintsWithVisualFormat:@"|-50-[view1(==50)]]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1)];



    NSArray *c1 = 	[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[view1(==60)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1)];




    NSArray *array = @[c0,c1];
    [view addConstraints:array];
     */

	// Do any additional setup after loading the view, typically from a nib.
}


-(void)demo
{
    	UIView *backview = [[UIView alloc] init];
    	backview.backgroundColor = [UIColor greenColor];
        [backview setTranslatesAutoresizingMaskIntoConstraints:NO];


        UIView *redView = [UIView autolayoutView:backview];
    	redView.backgroundColor = [UIColor redColor];



    UIButton *button = [UIButton autolayoutView:backview];
    button.backgroundColor = [UIColor whiteColor];

   // NSMutableArray *buttonConstraints = [NSMutableArray array];


//    [buttonConstraints addObjectsFromArray:
//     [NSLayoutConstraint constraintsWithVisualFormat:@"[button(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)]];
//
//    [buttonConstraints addObjectsFromArray:
//     [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:backview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
//
//    [buttonConstraints addObjectsFromArray:
//         [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-300-[button(==60)]"  options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)]];
// [backview addConstraints:buttonConstraints];


    //button的中点等于backview中点
//    [backview addConstraint:[NSLayoutConstraint
//                              constraintWithItem:button
//                              attribute:NSLayoutAttributeCenterX
//                              relatedBy:NSLayoutRelationEqual
//                              toItem:backview
//                              attribute:NSLayoutAttributeCenterX
//                              multiplier:1
//                              constant:0]];
    [ALVPin pinToView:button];
NSLayoutAttributeBottom
//下面这两个相当
//butto的底部等于backview底部 -20
//    [backview addConstraint:[NSLayoutConstraint
//                             constraintWithItem:button
//                             attribute:NSLayoutAttributeBottom
//                             relatedBy:NSLayoutRelationEqual
//                             toItem:backview
//                             attribute:NSLayoutAttributeBottom
//                             multiplier:1
//                             constant:-20]];
    [ALBottomSteelWire bindToView:button dimensions:150];



    //buttonde 的高度等于backview高度的0.3
    [button setHeight:50];
    [button setWidth:150];


//    [backview addConstraint:[NSLayoutConstraint
//                             constraintWithItem:button
//                             attribute:NSLayoutAttributeWidth
//                             relatedBy:NSLayoutRelationEqual
//                             toItem:backview
//                             attribute:NSLayoutAttributeWidth
//                             multiplier:0.3
//                             constant:0]];



    	NSMutableArray *tmpConstraints = [NSMutableArray array];

    	[tmpConstraints addObjectsFromArray:
         [NSLayoutConstraint constraintsWithVisualFormat:@"|-50-[redView(==200)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(redView)]];

    	[tmpConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[redView(==60)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(redView)]];


    	[backview addConstraints:tmpConstraints];

        UIView *leftView = [UIView autolayoutView:redView];
        leftView.backgroundColor = [UIColor yellowColor];




    NSMutableArray *tmpConstraints1 = [NSMutableArray array];

    //    UIView *inputView = [[UIView alloc]init];
    //    inputView.translatesAutoresizingMaskIntoConstraints = NO;
    //    [redView addSubview:inputView];
    //
    //    UIView *rightView = [[UIView alloc]init];
    //    rightView.translatesAutoresizingMaskIntoConstraints = NO;
    //    [redView addSubview:rightView];

    [tmpConstraints1 addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|-2-[leftView(==50)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(leftView)]];
    [tmpConstraints1 addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-2-[leftView]-2-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(leftView)]];
    
    [redView addConstraints:tmpConstraints1];

    self.view = backview;
}


//-(UIView *)autolayoutView:(UIView *)superView
//{
//    UIView *autolayoutView = [[UIView alloc] init];
//    [autolayoutView setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [superView addSubview:autolayoutView];
//    return autolayoutView;
//}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
 UIView *leftView = [[UIView alloc]init];
 leftView.backgroundColor = [UIColor greenColor];
 leftView.translatesAutoresizingMaskIntoConstraints = NO;
 [redView addSubview:leftView];

 //    UIView *inputView = [[UIView alloc]init];
 //    inputView.translatesAutoresizingMaskIntoConstraints = NO;
 //    [redView addSubview:inputView];
 //
 //    UIView *rightView = [[UIView alloc]init];
 //    rightView.translatesAutoresizingMaskIntoConstraints = NO;
 //    [redView addSubview:rightView];

 c0 = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[leftView(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(leftView)];
 c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[leftView(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(leftView)];

 [redView addConstraints:@[c0,c1]];
 */

@end
