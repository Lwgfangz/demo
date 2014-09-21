//
//  DMAppDelegate.h
//  demo_多个viewController的管理
//
//  Created by Lwgfangz on 14-9-14.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentsController.h"
@interface DMAppDelegate : UIResponder <UIApplicationDelegate>
{

}
@property (strong, nonatomic) SegmentsController *segmentsController;
@property (strong, nonatomic) UIWindow *window;

@end
