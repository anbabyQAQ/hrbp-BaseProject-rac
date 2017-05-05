//
//  BaseDefin.h
//  BaseProject
//
//  Created by tyl on 2017/4/24.
//  Copyright © 2017年 tyl. All rights reserved.
//

#ifndef BaseDefin_h
#define BaseDefin_h


/*! 字体 */
#define BA_FontSize(fontSize) [UIFont systemFontOfSize:fontSize]

/*! weakSelf */
#define BA_WEAKSELF typeof(self) __weak weakSelf = self
#define BA_WeakSelf(type)  __weak typeof(type) weak##type = type;

/*! strongSelf */
#define BA_StrongSelf(type)  __strong typeof(type) type = weak##type;

/*! 用safari打开URL */
#define BA_OpenUrl(urlStr) [BASharedApplication openURL:[NSURL URLWithString:urlStr]]

/*! 获取AppDelegate */
#define APPDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

/*! 获取sharedApplication */
#define BASharedApplication [UIApplication sharedApplication]

/*! 通知 */
#define BA_NotiCenter [NSNotificationCenter defaultCenter]

#define BA_UserDefault [NSUserDefaults standardUserDefaults]

/*! 图片 */
#define BA_ImageName(imageName) [UIImage imageNamed:imageName]

/*! 获取图片资源 */
#define BA_GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]


#define FirstLogin  @"firstlogin"
#define BANotioKey_LoginFinish   @"BANotioKey_LoginFinish"


#endif /* BaseDefin_h */

