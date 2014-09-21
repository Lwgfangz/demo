//
//  ALPin.m
//  demo_ 自动布局
//
//  Created by Lwgfangz on 14-9-21.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "ALPin.h"

@implementation ALPin
+(void)pinToView:(UIView *)view
       attribute:(NSLayoutAttribute)attribute
{
    [view.superview addConstraint:[NSLayoutConstraint
                             constraintWithItem:view
                             attribute:attribute
                             relatedBy:NSLayoutRelationEqual
                             toItem:view.superview
                             attribute:attribute
                             multiplier:1
                             constant:0]];
}
@end
