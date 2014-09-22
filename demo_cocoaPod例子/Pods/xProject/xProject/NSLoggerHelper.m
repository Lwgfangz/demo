//
//  AILogger.m
//  AnJia
//
//  Created by Lwgfangz on 14-7-17.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "NSLoggerHelper.h"
#import "LoggerClient.h"
static dispatch_queue_t loggingQueues;
BOOL isSuportObject(id obj);
typedef NS_ENUM(NSInteger, LOG_LEVEL)
{
    LOG_LEVEL_DEBUG = 4,
    LOG_LEVEL_INFO  = 3,
    LOG_LEVEL_ERROR = 2,
    LOG_LEVEL_FATAL = 1,
};

#define    LOG_DOMAIN_FH8610_INTERFACE @"INTERFACE"
#define    LOG_DOMAIN_AJ_LIB           @"LIB"
#define    LOG_DOMAIN_AJ_UI            @"UI"

@implementation NSLoggerHelper

+(void)load
{
    LoggerSetOptions(NULL,						// configure the default logger
                     kLoggerOption_BufferLogsUntilConnection|
                     kLoggerOption_BrowseBonjour|
                     kLoggerOption_BrowseOnlyLocalDomain);
    LoggerSetViewerHost(NULL, NULL, 0);
    LogMessage(@"APP",1,@"启动");
}

@end



void AILog(NSString *domain, int level, id obj,const char *filename, int lineNumber, const char *functionName)
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,
                  ^{
                      loggingQueues = dispatch_queue_create("log serial queue", NULL);
                  });
    
    
    if(!isSuportObject(obj))
    {
        return;
    }
    
    dispatch_async(loggingQueues,
    ^{
        if([obj isKindOfClass:[NSString class]])
        {
            //LogMessage(domain,level,@"%@",(NSString *)obj);
            LogMessageF(filename,lineNumber,functionName,domain,level,@"%@",(NSString *)obj);
        }
        
        if([obj isKindOfClass:[UIImage class]])
        {
            UIImage *image = (UIImage *)obj;
            NSData *data = UIImagePNGRepresentation(image);
            //LogImageData(domain,level,image.size.width,image.size.height,data);
            LogImageDataF(filename,lineNumber,functionName,domain,level,image.size.width,image.size.height,data);
        }

    });
}

//目前支持UIImage / NSString
void LibDebug(id obj,const char *filename, int lineNumber, const char *functionName)
{
    AILog(LOG_DOMAIN_AJ_LIB, LOG_LEVEL_DEBUG,obj,filename,lineNumber,functionName);
    
}

void LibInfo(id obj,const char *filename, int lineNumber, const char *functionName)
{
    AILog(LOG_DOMAIN_AJ_LIB, LOG_LEVEL_INFO,obj,filename,lineNumber,functionName);
}

void LibError(id obj,const char *filename, int lineNumber, const char *functionName)
{
    AILog(LOG_DOMAIN_AJ_LIB, LOG_LEVEL_ERROR,obj,filename,lineNumber,functionName);
}

void LibFatal(id obj,const char *filename, int lineNumber, const char *functionName)
{
    AILog(LOG_DOMAIN_AJ_LIB, LOG_LEVEL_FATAL,obj,filename,lineNumber,functionName);
}

void UIDebug(id obj,const char *filename, int lineNumber, const char *functionName)
{
    AILog(LOG_DOMAIN_AJ_UI, LOG_LEVEL_DEBUG,obj,filename,lineNumber,functionName);
}

void UIInfo(id obj,const char *filename, int lineNumber, const char *functionName)
{
    AILog(LOG_DOMAIN_AJ_UI, LOG_LEVEL_INFO,obj,filename,lineNumber,functionName);
}

void UIError(id obj,const char *filename, int lineNumber, const char *functionName)
{
    AILog(LOG_DOMAIN_AJ_UI, LOG_LEVEL_ERROR,obj,filename,lineNumber,functionName);
}

void UIFatal(id obj,const char *filename, int lineNumber, const char *functionName)
{
    AILog(LOG_DOMAIN_AJ_UI, LOG_LEVEL_FATAL,obj,filename,lineNumber,functionName);
}

BOOL isSuportObject(id obj)
{
    return YES;//TODO   NSString  __NSCFConstantString
    NSArray *suportClass = @[[NSString class],[UIImage class]];
    if([suportClass containsObject:[obj class] ])
    {
        return YES;
    }
    else
    {
        return NO;
    }

}

