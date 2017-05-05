
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

#import "NSString+BAColor.h"

@implementation NSString (BAColor)

/*!
 *  返回十六进制的color 随机颜色
 *
 *  @return randomColor
 */
+ (NSString *)randomColorWithHex
{
    NSString *colorString;
    NSArray *colorArr = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",@"a", @"b", @"c", @"d", @"e", @"f"];
    
    for (NSInteger i= 0; i < 6; i++)
    {
        int r = arc4random()%colorArr.count;
        NSString *string = colorArr[r];
        colorString = [NSString stringWithFormat:@"%@%@", colorString, string];
    }
    
    /*! 截取后六位，避免前面的(null) */
    NSString *colorStr = [colorString substringFromIndex:6];
    if (colorStr.length < 6) { colorStr = @"00EBFF"; }
    NSLog(@"随机颜色为：%@", colorStr);
    return colorStr;
}

@end
