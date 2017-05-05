
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
NS_ASSUME_NONNULL_BEGIN

@interface NSString (Trims)
/*!
 
 封装说明：
 所有 特殊字符 类型的字符处理类，包含：手机号码格式化、数字格式化等
 
 */

/*!
 *  @brief  清除html标签
 *
 *  @return 清除后的结果
 */
- (NSString *)ba_stringByStrippingHTML;

/*!
 *  @brief  清除js脚本
 *
 *  @return 清楚js后的结果
 */
- (NSString *)ba_stringByRemovingScriptsAndStrippingHTML;

/*!
 *  @brief  去除空格
 *
 *  @return 去除空格后的字符串
 */
- (NSString *)ba_trimmingWhitespace;

/*!
 *  @brief  去除字符串与空行
 *
 *  @return 去除字符串与空行的字符串
 */
- (NSString *)ba_trimmingWhitespaceAndNewlines;


/*! 去掉字符串中的html标签的方法 */
+ (NSString *)ba_filterHTML:(NSString *)html;

/*!
 *  去除字符串的特殊字符
 *
 *  @param string 需要处理的字符串（如：NSString *string = @"<f7091300 00000000 830000c4 00002c00 0000c500>";）
 *
 *  @return 去除字符串的特殊字符
 */
+ (nullable NSString *)ba_trimmedString:(nullable NSString *)string;

@end
NS_ASSUME_NONNULL_END
