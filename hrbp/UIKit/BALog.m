//
//  BALog.m
//  BaseProject
//
//  Created by tyl on 2017/4/24.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import "BALog.h"
static NSString *logString = @"";

@implementation BALog


void ExtendNSLog(const char *file, int lineNumber, const char *functionName, NSString *format, ...)
{
    va_list ap;
    
    va_start (ap, format);
    
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    
    NSString *body = [[NSString alloc] initWithFormat:format
                                            arguments:ap];
    
    va_end (ap);
    
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    fprintf(stderr, "(🎈%s🎈) \r\n(📍%s 第: %d 行📍) \r\n📚\r%s📚", functionName, [fileName UTF8String], lineNumber, [body UTF8String]);
    
    if([logString isEqualToString:@""])
        logString = body;
    else
        logString = [NSString stringWithFormat:@"%@%@", logString, body];
}

+ (NSString *)logString
{
    return logString;
}

+ (void)clearLog
{
    logString = @"";
}



@end
