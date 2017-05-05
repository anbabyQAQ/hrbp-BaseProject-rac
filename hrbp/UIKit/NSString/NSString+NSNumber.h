
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

@interface NSString (NSNumber)
/*! 
 
 封装说明：
    所有 数字 类型的字符处理类，包含：手机号码格式化、数字格式化等
 
 */


/*! 
 注意：中英文输出样式不一样，如果有国际化的请注意输出样式，
      本样式为中文输出环境，模拟器可能输出为英文样式
 */

/*! 手机号码格式化样式：344【中间空格】，示例：13855556666 --> 138 5555 6666 */
+ (NSString *)ba_phoneNumberFormatterSpace:(NSString *)phoneNumber;

/*! 手机号码格式化样式：3*4【中间4位为*】，示例：13855556666 --> 138****6666 */
+ (NSString *)ba_phoneNumberFormatterCenterStar:(NSString *)phoneNumber;

/*! 数字格式化样式，示例：12345678.89 --> 12,345,678.89 */
+ (NSString *)ba_stringFormatterWithStyle:(NSNumberFormatterStyle)numberStyle numberString:(NSString *)numberString;

/*! 格式化为带小数点的数字，示例：12345678.89 --> 12,345,678.89 */
+ (NSString *)ba_stringFormatterWithDecimalStyleWithNumberString:(NSString *)numberString;

/*! 格式化为货币样式，示例：12345678.89 --> 12,345,678.89 */
+ (NSString *)ba_stringFormatterWithCurrencyStyleWithNumberString:(NSString *)numberString;

/*! 格式化为百分比样式，示例：12345678.89 --> 1,234,567,889% */
+ (NSString *)ba_stringFormatterWithPercentStyleWithNumberString:(NSString *)numberString;

/*! 格式化为科学计数样式，示例：12345678.89 --> 1.234567889E7 */
+ (NSString *)ba_stringFormatterWithScientificStyleWithNumberString:(NSString *)numberString;

/*! 格式化为英文输出样式（注：此处根据系统语言输出），示例：12345678.89 --> 一千二百三十四万五千六百七十八点八九 */
+ (NSString *)ba_stringFormatterWithSpellOutStyleWithNumberString:(NSString *)numberString;

/*! 格式化为序数样式，示例：12345678.89 --> 第1234,5679 */
+ (NSString *)ba_stringFormatterWithOrdinalStyleWithNumberString:(NSString *)numberString;

/*! 格式化为四舍五入样式，示例：12345678.89 --> 12,345,679 */
+ (NSString *)ba_stringFormatterWithCurrencyISOCodeStyleWithNumberString:(NSString *)numberString;

/*! 格式化为货币多样式，示例：12345678.89 --> USD 12,345,678.89 */
+ (NSString *)ba_stringFormatterWithCurrencyPluralStyleWithNumberString:(NSString *)numberString;

/*! 保留纯数字 */
- (NSString *)ba_removeStringSaveNumber;

@end
