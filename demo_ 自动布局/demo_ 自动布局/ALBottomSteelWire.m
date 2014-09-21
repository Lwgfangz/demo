//
//  ALBottomSteelWire.m
//  demo_ 自动布局
//
//  Created by Lwgfangz on 14-9-21.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "ALBottomSteelWire.h"

@implementation ALBottomSteelWire
+(void)bindToView:(UIView *)view
       dimensions:(CGFloat )dimensions
{
    [super bindToView:view dimensions:dimensions attribute:NSLayoutAttributeBottom];
}
@end
