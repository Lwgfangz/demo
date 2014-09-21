//
//  ALSteelWire.h
//  demo_ 自动布局
//
//  Created by Lwgfangz on 14-9-21.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALSteelWire : NSObject
{

}
//绑到view上，另外一头绑到它的superView上
+(void)bindToView:(UIView *)view
       dimensions:(CGFloat )dimensions
        attribute:(NSLayoutAttribute)attribute;
@end
