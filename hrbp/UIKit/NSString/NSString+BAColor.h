
/*!
 *  @header BAKit.h
 *          BaseProject
 *
 *  @brief  BAKit
 *
 *  @author tyl
 *  @copyright    Copyright © 2017年 tyl. All rights reserved.
 *  @version    V1.0
 */
#import <Foundation/Foundation.h>

@interface NSString (BAColor)
/*!
 
 封装说明：
 所有 颜色 类型的字符处理类，包含：十六进制随机颜色处理等
 
 */


/*!
 *  返回十六进制的color 随机颜色
 *
 *  @return randomColor
 */
+ (NSString *)randomColorWithHex;



@end
