//
//  BATextField.h
//  BaseProject
//
//  Created by tyl on 2017/4/25.
//  Copyright © 2017年 tyl. All rights reserved.
//
#import <UIKit/UIKit.h>

/*! BATextField 样式枚举 */
typedef NS_ENUM(NSInteger, BATextFieldStyle) {
    /*! 默认 */
    BATextfieldStyleNone,
    /*! 手机号码格式化 【格式化结果：138 1111 1111】 */
    BATextfieldStylePhone,
    /*! 银行卡卡号格式化【格式化结果：1111 1111 1111 1234】 */
    BATextfieldStyleBank
};

@interface BATextField : UITextField

/*! textfiled 输入的格式化格式 有四种 */
@property (nonatomic) BATextFieldStyle textfieldStyle;

/*! 可以用 xib 直接设置 */

/**
 *  电话号码限制验证码限制(默认只能输入11位数字)
 */
@property (assign, nonatomic) IBInspectable BOOL phoneRestrict;
/**
 *  限制输入长度
 */
@property (assign, nonatomic) IBInspectable NSInteger lengthRestrict;
/**
 *  带小数点的数字限制(默认只能输入小数位后2位)
 */
@property (assign, nonatomic) IBInspectable BOOL decimalsRestrict;
/**
 *  验证码限制(默认只能输入6位数字)
 */
@property (assign, nonatomic) IBInspectable BOOL verCodeRestrict;
/**
 *  限制只能输入数字
 */
@property (assign, nonatomic) IBInspectable BOOL numberRestrict;


@end
