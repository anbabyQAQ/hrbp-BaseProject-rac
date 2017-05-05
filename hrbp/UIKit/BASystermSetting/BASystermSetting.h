//
//  BASystermSetting.h
//  BaseProject
//
//  Created by tyl on 2017/4/24.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BASystermSetting : NSObject

/*!
 *  创建单例 ba_systermSettingManage
 *
 *  @return ba_systermSettingManage
 */
+ (BASystermSetting *)ba_systermSettingManage;

#pragma mark - ***** app跳转到系统的各种基本设置选项
/*!
 *  跳转系统通知
 */
- (void)ba_gotoSystermSettings;

/*!
 *  跳到WIFI界面
 */
- (void)ba_gotoSystermWIFISettings;

/*!
 *  跳到About关于本机界面
 */
- (void)ba_gotoSystermAboutSettings;

/*!
 *  跳到Accessibility辅助功能界面
 */
- (void)ba_gotoSystermAccessibilitySettings;

/*!
 *  跳到AirplaneModeOn飞行模式界面
 */
- (void)ba_gotoSystermAirplaneModeOnSettings;

/*!
 *  跳到Auto-Lock自动锁屏时间界面
 */
- (void)ba_gotoSystermAutoLockSettings;

/*!
 *  跳到Brightness自动锁定界面
 */
- (void)ba_gotoSystermBrightnessSettings;

/*!
 *  跳到MICROPHONE麦克风界面
 */
- (void)ba_gotoSystermMICROPHONESettings;

/*!
 *  跳到CONTACTS通讯录界面
 */
- (void)ba_gotoSystermCONTACTSSettings;

/*!
 *  跳到Bluetooth蓝牙界面
 */
- (void)ba_gotoSystermBluetoothSettings;

/*!
 *  跳到DATE_AND_TIME日期和时间界面
 */
- (void)ba_gotoSystermDATE_AND_TIMESettings;

/*!
 *  跳到FaceTime界面
 */
- (void)ba_gotoSystermFaceTimeSettings;

/*!
 *  跳到General界面
 */
- (void)ba_gotoSystermGeneralSettings;

/*!
 *  跳到Keyboard界面
 */
- (void)ba_gotoSystermKeyboardSettings;

/*!
 *  跳到iCloud界面
 */
- (void)ba_gotoSystermiCloudSettings;

/*!
 *  跳转Safari浏览器
 *
 *  @param url 需要用Safari打开的url
 */
- (void)ba_gotoSafariBrowserWithURL:(NSString *)url;



@end
