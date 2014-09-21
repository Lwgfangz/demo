//
//  ALPin.h
//  demo_ 自动布局
//
//  Created by Lwgfangz on 14-9-21.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import <Foundation/Foundation.h>
//只能pin中点
@interface ALPin : NSObject
//把钉子钉到view上和它的superView上
//钉子有横钉和竖钉，   - HPin 固定y   | VPin 固定x ,x不能活动
//  + HVPin ,x，y都不能动


//屏幕扩展是上下左右都拉拉伸或缩小
+(void)pinToView:(UIView *)view
        attribute:(NSLayoutAttribute)attribute;
@end
