//
//  BaseColor.h
//  BaseProject
//
//  Created by tyl on 2017/4/24.
//  Copyright © 2017年 tyl. All rights reserved.
//

#ifndef BaseColor_h
#define BaseColor_h

#pragma mark - ***** 颜色设置

/*! RGB色值 */
//#define ba_RGBAColor(R, G, B, A)      [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

/*! 随机色 */
#define BARandomColor      [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
#define BA_ColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define BA_BGClearColor         [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.7f]

static inline UIColor *ba_RGBAColor(float r,float g,float b, float a) { return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];}

/*! 主题微信绿 */
#define BA_WeXin_greenColor      ba_RGBAColor(0, 190, 12, 1)

/*! 白色 1.0 white */
#define BA_White_Color          ba_RGBAColor(255, 255, 255, 1)

/*! 红色 1.0, 0.0, 0.0 RGB */
#define BA_Red_Color            ba_RGBAColor(255, 0, 0, 1)

/*! 黄色 1.0, 1.0, 0.0 RGB */
#define BA_Yellow_Color         ba_RGBAColor(255, 255, 0, 1)

/*! 绿色 0.0, 1.0, 0.0 RGB */
#define BA_Green_Color          ba_RGBAColor(0, 255, 0, 1)

/*! 蓝色 0.0, 0.0, 1.0 RGB */
#define BA_Blue_Color           ba_RGBAColor(0, 0, 255, 1)

/*! 无色 0.0 white, 0.0 alpha */
#define BA_Clear_Color          ba_RGBAColor(0, 0, 0, 0)

/*! 橙色 1.0, 0.5, 0.0 RGB */
#define BA_Orange_Color         ba_RGBAColor(255, 255, 0, 1)

/*! 黑色 0.0 white */
#define BA_Black_Color          ba_RGBAColor(0, 0, 0, 1)

/*! 浅灰色 0.667 white */
#define BA_LightGray_Color      ba_RGBAColor(255, 255, 255, 0.667)

/*! 灰色 0.5 white */
#define BA_Gray_Color           [UIColor grayColor]

/*! 青色 0.0, 1.0, 1.0 RGB */
#define BA_Cyan_Color           [UIColor cyanColor]

/*! 深灰色 0.333 white */
#define BA_DarkGray_Color       [UIColor darkGrayColor]

/*! 红褐色 1.0, 0.0, 1.0 RGB */
#define BA_Magenta_Color        [UIColor magentaColor]

/*! 棕色 0.6, 0.4, 0.2 RGB */
#define BA_Brown_Color          [UIColor brownColor]

/*! 红褐色 1.0, 0.0, 1.0 RGB */
#define BA_Magenta_Color        [UIColor magentaColor]

/*! 紫色 0.5, 0.0, 0.5 RGB */
#define BA_Purple_Color         [UIColor purpleColor]




/*! 主色 */
#define BA_Mian_Color             [UIColor colorWithHexString:@"E66440"]

/*! 辅色 */
#define BA_Assist_Color           [UIColor colorWithHexString:@"222833"]

/*! titleColor */
#define BA_Title_Color            [UIColor colorWithHexString:@"222222"]

/*! SubtitleColor */
#define BA_Subtitle_Color          [UIColor colorWithHexString:@"666666"]

/*! Cutting line Color */
#define BA_CuttingLine_Color       [UIColor colorWithHexString:@"D7D7D7"]

/*! Cutting Modules Color */
#define BA_CuttingModules_Color    [UIColor colorWithHexString:@"F1F3F6"]


#endif /* BaseColor_h */
