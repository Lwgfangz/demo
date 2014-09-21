//
//  DMAppDelegate.m
//  demo_多个viewController的管理
//
//  Created by Lwgfangz on 14-9-14.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "DMAppDelegate.h"
#import "SegmentsController.h"
@implementation DMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    NSArray * viewControllers = [self segmentViewControllers];
    UINavigationController * navigationController = [[[UINavigationController alloc] init] autorelease];
    self.segmentsController = [[SegmentsController alloc] initWithNavigationController:navigationController viewControllers:viewControllers];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:[viewControllers arrayByPerformingSelector:@selector(title)]];
    self.segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [self.segmentedControl addTarget:self.segmentsController action:@selector(indexDidChangeForSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    [self firstUserExperience];
    [window addSubview:navigationController.view]; [window makeKeyAndVisible];
    return YES;
}

- (NSArray *)segmentViewControllers
{
    UIViewController * italy = [UIViewController new];
    italy.view.backgroundColor = [UIColor redColor];
    UIViewController * australia = [UIViewController new];
    australia.view.backgroundColor = [UIColor greenColor];
    NSArray * viewControllers = [NSArray arrayWithObjects:italy, australia, nil];
    [australia release];
    [italy release];
    return viewControllers;
}
- (void)firstUserExperience
{
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentsController indexDidChangeForSegmentedControl:self.segmentedControl];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
