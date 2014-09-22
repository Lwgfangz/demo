//
//  RemoteFile.h
//  AICamera
//
//  Created by Lwgfangz on 14-6-24.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AICameraLib.h"


typedef NS_ENUM(NSInteger, FileType)
{
    FileType_Pic,
    FileType_Record,
};

typedef NS_ENUM(NSInteger, FileMode)
{
    FileMode_Manual,     // 手动
    FileMode_Time,       // 定时
    FileMode_Alarm,      // 报警
};

@interface RemoteFile : NSObject
{
}
@property (nonatomic,assign,readonly) FileType fileType;
@property (nonatomic,assign,readonly) FileMode fileMode;
@property (nonatomic,assign,readonly) BOOL isLock;
@property (nonatomic,copy,readonly) NSString *startTime;
@property (nonatomic,copy,readonly) NSString *stopTime;
@property (nonatomic,copy,readonly) NSString *dataSize;


- (void)saveToLocal:(NSString *)path success:(OpSuccess)success failure:(OpFailure)failure;
- (void)lock:(OpSuccess)success failure:(OpFailure)failure;
- (void)unlock:(OpSuccess)success failure:(OpFailure)failure;
//TODO:lock
@end
