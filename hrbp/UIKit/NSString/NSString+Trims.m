
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

#import "NSString+Trims.h"

@implementation NSString (Trims)

/*!
 *  @brief  清除html标签
 *
 *  @return 清除后的结果
 */
- (NSString *)ba_stringByStrippingHTML
{
    return [self stringByReplacingOccurrencesOfString:@"<[^>]+>" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, self.length)];
}

/*!
 *  @brief  清除js脚本
 *
 *  @return 清楚js后的结果
 */
- (NSString *)ba_stringByRemovingScriptsAndStrippingHTML
{
    NSMutableString *mString = [self mutableCopy];
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<script[^>]*>[\\w\\W]*</script>" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regex matchesInString:mString options:NSMatchingReportProgress range:NSMakeRange(0, [mString length])];
    for (NSTextCheckingResult *match in [matches reverseObjectEnumerator])
    {
        [mString replaceCharactersInRange:match.range withString:@""];
    }
    return [mString ba_stringByStrippingHTML];
}

/*!
 *  @brief  去除空格
 *
 *  @return 去除空格后的字符串
 */
- (NSString *)ba_trimmingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

/*!
 *  @brief  去除字符串与空行
 *
 *  @return 去除字符串与空行的字符串
 */
- (NSString *)ba_trimmingWhitespaceAndNewlines
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/*! 去掉字符串中的html标签的方法 */
+ (NSString *)ba_filterHTML:(NSString *)html
{
    NSScanner *scanner = [NSScanner scannerWithString:html];
    NSString *text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    //    NSString * regEx = @"<([^>]*)>";
    //    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];    //去掉html里面的空格
    html = [html stringByReplacingOccurrencesOfString:@"\n" withString:@""];    //去掉换行
    
    html = [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];  //去掉前后两边空白
    //    BALog(@"html:------------%@",html);
    return html;
}

/*!
 *  去除字符串的特殊字符
 *
 *  @param string 需要处理的字符串（如：NSString *string = @"<f7091300 00000000 830000c4 00002c00 0000c500>";）
 *
 *  @return 去除字符串的特殊字符
 */
+ (nullable NSString *)ba_trimmedString:(nullable NSString *)string
{
    // 去除字符串的特殊字符
    //    NSString *string = @"<f7091300 00000000 830000c4 00002c00 0000c500>";
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、<>[]{}#%-*+=_\\|~＜＞$?^?'@#$%^&*()_+'\""];
    NSString*trimmedString = [string stringByTrimmingCharactersInSet:set];
    BALog(@"trimmedString1:%@",trimmedString);
    // 去除字符串的空格
    trimmedString = [trimmedString stringByReplacingOccurrencesOfString:@" " withString:@""];
    BALog(@"trimmedString2: %@",trimmedString);
    
    return trimmedString;
}

@end
