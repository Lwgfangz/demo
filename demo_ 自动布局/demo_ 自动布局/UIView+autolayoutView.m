//
//  UIView+autolayoutView.m
//  demo_ 自动布局
//
//  Created by Lwgfangz on 14-9-21.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "UIView+autolayoutView.h"

@implementation UIView (autolayoutView)
+(instancetype)autolayoutView:(UIView *)superView;
{
    id instance = [[[self class]alloc] init];
    [instance setTranslatesAutoresizingMaskIntoConstraints:NO];
    [superView addSubview:instance];
    return instance;
}

-(void)setWidth:(CGFloat)width
{
    [self addConstraint:[NSLayoutConstraint
                           constraintWithItem:self
                           attribute:NSLayoutAttributeWidth
                           relatedBy:NSLayoutRelationGreaterThanOrEqual
                           toItem:nil
                           attribute:NSLayoutAttributeNotAnAttribute //
                           multiplier:0.5
                           constant:width]];
}
-(void)setHeight:(CGFloat)height
{
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationGreaterThanOrEqual
                         toItem:nil
                         attribute:NSLayoutAttributeNotAnAttribute //
                         multiplier:0.5
                         constant:height]];
}
//
//- (void)ng_setTabBarItem:(NGTabBarItem *)ng_tabBarItem {
//    objc_setAssociatedObject(self, &itemKey, ng_tabBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (NGTabBarItem *)ng_tabBarItem {
//    return objc_getAssociatedObject(self, &itemKey);
//}
@end
