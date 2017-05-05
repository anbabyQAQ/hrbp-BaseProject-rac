

#import <Foundation/Foundation.h>

/**
 *  给NSProcessInfo类添加许多有用的方法
 */
@interface NSProcessInfo (BAKit)

/**
 *  返回的CPU使用率
 */
+ (float)cpuUsage;

@end
