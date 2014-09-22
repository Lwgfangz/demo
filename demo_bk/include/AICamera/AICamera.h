//
//  AICamera.h
//  AICamera
//
//  Created by Lwgfangz on 14-6-18.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AICameraLib.h"
@class RemoteFile;



@interface AICamera : NSObject
//类工厂方法
+ (AICamera *)cameraWithType:(CAMERA_TYPE)type;

- (void)open:(OpSuccess)success failure:(OpFailure)failure;

- (void)close:(OpSuccess)success failure:(OpFailure)failure;

/*
 开始/停止预览
 */
- (void)startCapture:(OpSuccess)success failure:(OpFailure)failure;
- (void)stopCapture:(OpSuccess)success failure:(OpFailure)failure;

/*
 拍照.
 对于本地摄像头:  必须指定savePath
 对于wifi摄像头: savePath为空则把拍照的照片放入wifi TF卡,如果不为空,则放到savepath中
 */
- (void)takePhoto:(NSString*)savePath
          success:(OpSuccess)success
          failure:(OpFailure)failure;

/*
 开始/停止录像
 对于wifi摄像头,savePath设为nil
 */
- (void)startRecord:(NSString*)savePath
            success:(OpSuccess)success
            failure:(OpFailure)failure;

- (void)stopRecord:(OpSuccess)Success
           failure:(OpFailure)failure;

/*
 取得摄像头上存储卡的文件列表.
 成功返回RemoteFile数组.
 */
- (void)getFiles:(OpSuccess)Success failure:(OpFailure)failure;

//删除文件RemoteFile
-(void)deleteFile:(OpSuccess)success failure:(OpFailure)failure file:(RemoteFile *)file;
@end
