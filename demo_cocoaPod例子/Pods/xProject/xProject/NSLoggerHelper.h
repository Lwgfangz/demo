//
//  AILogger.h
//  AnJia
//
//  Created by Lwgfangz on 14-7-17.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

/*
 NSLogger的帮助类.
 需要在项目中定义宏 #define USE_NSLOGGER //是否使用NSLogger
 */
#import <Foundation/Foundation.h>
@interface NSLoggerHelper : NSObject
{
    
}
@end
#ifdef __cplusplus
extern "C" {
#endif
    void LibDebug(id obj,const char *filename, int lineNumber, const char *functionName);
    void LibInfo(id obj,const char *filename, int lineNumber, const char *functionName);
    void LibError(id obj,const char *filename, int lineNumber, const char *functionName);
    void LibFatal(id obj,const char *filename, int lineNumber, const char *functionName);
    void UIDebug(id obj,const char *filename, int lineNumber, const char *functionName);
    void UIInfo(id obj,const char *filename, int lineNumber, const char *functionName);
    void UIError(id obj,const char *filename, int lineNumber, const char *functionName);
    void UIFatal(id obj,const char *filename, int lineNumber, const char *functionName);

#ifdef USE_NSLOGGER
    
#define LIB_DEBUG(obj) LibDebug(obj ,__FILE__,__LINE__,__FUNCTION__)
#define LIB_INFO(obj) LibInfo(obj,__FILE__,__LINE__,__FUNCTION__)
#define LIB_ERROR(obj) LibError(obj ,__FILE__,__LINE__,__FUNCTION__)
#define LIB_FATAL(obj) LibFatal(obj ,__FILE__,__LINE__,__FUNCTION__)
    
#define UI_DEBUG(obj) UIDebug(obj ,__FILE__,__LINE__,__FUNCTION__)
#define UI_INFO(obj) UIInfo(obj,__FILE__,__LINE__,__FUNCTION__)
#define UI_ERROR(obj) UIError(obj ,__FILE__,__LINE__,__FUNCTION__)
#define UI_FATAL(obj) UIFatal(obj ,__FILE__,__LINE__,__FUNCTION__)
    
#else
#define LIB_DEBUG(obj) while(0)
#define LIB_INFO(obj) while(0)
#define LIB_ERROR(obj) while(0)
#define LIB_FATAL(obj) while(0)
    
#define UI_DEBUG(obj) while(0)
#define UI_INFO(obj) while(0)
#define UI_ERROR(obj) while(0)
#define UI_FATAL(obj) while(0)
#endif
    
#ifdef __cplusplus
}



#endif




