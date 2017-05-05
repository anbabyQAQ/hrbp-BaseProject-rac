//
//  NSNumber+BAKit.h
//  BaseProject
//
//  Created by tyl on 2017/4/25.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
/**
 *  给NSNumber类添加许多有用的方法
 */
@interface NSNumber (BAKit)

#if __cplusplus
extern "C" {
#endif
/**
 *  角度转成弧度
 */
CGFloat DegreesToRadians(CGFloat degrees);
    
/**
 *  弧度转成角度
 */
CGFloat RadiansToDegrees(CGFloat radians);
#if _cplusplus
}
#endif

/**
 *  创建在给定范围之间的随机整数
 */
+ (NSInteger)randomIntBetweenMin:(NSInteger)minValue
                          andMax:(NSInteger)maxValue;

/**
 *  创建一个随机浮点值
 */
+ (CGFloat)randomFloat;

/**
 *  创建在给定范围之间的随机浮点数
 */
+ (CGFloat)randomFloatBetweenMin:(CGFloat)minValue
                          andMax:(CGFloat)maxValue;

/**
 Creates and returns an NSNumber object from a string.
 Valid format: @"12", @"12.345", @" -0xFF", @" .23e99 "...
 
 @param string  The string described an number.
 
 @return an NSNumber when parse succeed, or nil if an error occurs.
 */
+ (nullable NSNumber *)numberWithString:(nullable NSString *)string;



@end
