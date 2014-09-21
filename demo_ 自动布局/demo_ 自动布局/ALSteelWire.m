//
//  ALSteelWire.m
//  demo_ 自动布局
//
//  Created by Lwgfangz on 14-9-21.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "ALSteelWire.h"

@implementation ALSteelWire
//绑到view上，另外一头绑到它的superView上
+(void)bindToView:(UIView *)view
       dimensions:(CGFloat )dimensions
        attribute:(NSLayoutAttribute)attribute
{

        CGFloat  newDimensions = dimensions;
        if(attribute == NSLayoutAttributeBottom ||
           attribute == NSLayoutAttributeRight)
        {
            newDimensions = 0.-dimensions;
        }
        [view.superview addConstraint:[NSLayoutConstraint
                                 constraintWithItem:view
                                 attribute:attribute
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:view.superview
                                 attribute:attribute
                                 multiplier:1
                                 constant:newDimensions]];

}
@end
