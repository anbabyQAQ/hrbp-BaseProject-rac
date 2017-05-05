//
//  NSObject+BAProgressHUD.h
//  BaseProject
//
//  Created by tyl on 2017/4/24.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface NSObject (BAProgressHUD)

/*!
 *  弹出文字提示（菊花转动）
 *
 *  @param text 提示内容
 */
- (void)BA_showAlert:(NSString *)text;

/*!
 *  弹出文字提示，自定义显示时间(默认1.5秒)
 *
 *  @param text 提示内容
 */
- (void)BA_showAlertWithTitle:(NSString *)text;

/*!
 *  显示忙
 */
- (void)BA_showBusy;

/*!
 *  隐藏提示
 */
- (void)BA_hideProgress;
@end
