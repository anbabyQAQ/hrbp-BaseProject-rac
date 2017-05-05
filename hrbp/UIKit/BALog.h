//
//  BALog.h
//  BaseProject
//
//  Created by tyl on 2017/4/24.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <Foundation/Foundation.h>

void ExtendNSLog(const char *file, int lineNumber, const char *functionName, NSString *format, ...);


@interface BALog : NSObject

/*! NSLog 仅在调试模式 */
#ifdef DEBUG
#define BALog(args ...) ExtendNSLog(__FILE__, __LINE__, __PRETTY_FUNCTION__, args);
#define BALogString [BALog logString]
#define BALogClear [BALog clearLog]
#else
#define BALog(args ...)
#define BALogString
#define BALogClear
#endif

/**
 *  清除日志字符串.
 *  可以用BALogClear宏调用它
 */
+ (void)clearLog;

/**
 *  获取日志字符串.
 *  可以用STLogString宏调用它
 */
+ (NSString *)logString;



@end
