//
//  AICameraLib.h
//  WifiCamera
//
//  Created by Lwgfangz on 14-6-18.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//
#ifndef _AICAMERALIB_H_
#define _AICAMERALIB_H_

/**
 *  操作摄像头成功返回
 *
 *  @param obj 服务器返回的JSON数据
 */
typedef void (^OpSuccess)(id obj);
/**
 *  操作摄像头失败
 *
 *  @param error 错误信息
 */
typedef void (^OpFailure)(NSError *error);

typedef  NS_ENUM(NSInteger, CAMERA_TYPE)
{
    CAMERA_TYPE_WIFI,
    CAMERA_TYPE_LOCAL
};

#define DOMAIN_FHDEV_LIB_ERROR @"FHDEV_LIB_ERROR"
#define DOMAIN_AI_LIB_ERROR @"AI_LIB_ERROR"

#define AI_ERROR_CODE_ALLREADY_REALPLAY 1000  //已经预览
#define AI_ERROR_CODE_WRITE_FILE_ERROR 1001  // 写文件失败
#define AI_ERROR_CODE_START_REMOTE_RECORD_ERROR 1002  // 写文件失败
#define AI_ERROR_CODE_TAKE_PHOTO_ERROR 1003  // 写文件失败



#import "thirdParty.h"

#import "AICamera.h"
#endif
