//
//  AppDelegate.h
//  demo_百度地图
//
//  Created by Lwgfangz on 14-6-27.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) BMKMapManager* mapManager;
@end
