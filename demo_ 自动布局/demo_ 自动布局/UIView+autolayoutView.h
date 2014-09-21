//
//  UIView+autolayoutView.h
//  demo_ 自动布局
//
//  Created by Lwgfangz on 14-9-21.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (autolayoutView)
+(instancetype)autolayoutView:(UIView *)superView;
-(void)setWidth:(CGFloat)width;
-(void)setHeight:(CGFloat)height;

@end
