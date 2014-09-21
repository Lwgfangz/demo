//
//  SegmentsController.h
//  demo_多个viewController的管理
//
//  Created by Lwgfangz on 14-9-14.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SegmentsController : NSObject {
    NSArray                * viewControllers;
    UINavigationController * navigationController;
}

@property (nonatomic, retain, readonly) NSArray                * viewControllers;
@property (nonatomic, retain, readonly) UINavigationController * navigationController;

- (id)initWithNavigationController:(UINavigationController *)aNavigationController
                   viewControllers:(NSArray *)viewControllers;

- (void)indexDidChangeForSegmentedControl:(UISegmentedControl *)aSegmentedControl;

@end
