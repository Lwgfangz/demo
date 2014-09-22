//
//  AppDelegate.m
//  demo_window的层级
//
//  Created by Lwgfangz on 14-6-26.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    self.window.backgroundColor = [UIColor yellowColor];
    [self.window makeKeyAndVisible];
    
//    UIWindow *normalWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    normalWindow.backgroundColor = [UIColor blueColor];
//    normalWindow.windowLevel = UIWindowLevelNormal;
//    [normalWindow makeKeyAndVisible];
    
    
    
    CGRect windowRect = CGRectMake(50,
                                   50,
                                   [[UIScreen mainScreen] bounds].size.width - 100,
                                   [[UIScreen mainScreen] bounds].size.height - 100);
    UIWindow *alertLevelWindow = [[UIWindow alloc] initWithFrame:windowRect];
    alertLevelWindow.windowLevel = UIWindowLevelAlert;
    alertLevelWindow.backgroundColor = [UIColor redColor];
        [alertLevelWindow makeKeyWindow];
    [alertLevelWindow makeKeyAndVisible];

    
    
//    UIWindow *statusLevelWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 50, 320, 20)];
//    statusLevelWindow.windowLevel = UIWindowLevelStatusBar;
//    statusLevelWindow.backgroundColor = [UIColor blackColor];
//    [statusLevelWindow makeKeyAndVisible];
    
    NSLog(@"Normal window level: %f", UIWindowLevelNormal);
    NSLog(@"Normal window level: %f", UIWindowLevelAlert);
    NSLog(@"Normal window level: %f", UIWindowLevelStatusBar);
    
    return YES;

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
