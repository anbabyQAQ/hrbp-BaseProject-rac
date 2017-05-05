//
//  UINavigationController+BAKit.h
//  BaseProject
//
//  Created by tyl on 2017/4/25.
//  Copyright © 2017年 tyl. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UINavigationController (BAKit)

@property(strong,nonatomic)UIImageView * nav_shadowView;

/*!
 *  显示navi的阴影
 */
- (void)ba_showNavShadowView;

/*!
 *  隐藏navi的阴影
 */
- (void)ba_hiddenNavShadowView;

/*!
 *  返回几层控制器
 *
 *  @param backCount backCount
 */
- (void)ba_popBackViewControllerCount:(NSInteger)backCount;

/*!
 *  返回第几层控制器
 *
 *  @param count count
 */
- (UIViewController *)ba_controllerByPopCount:(NSInteger)count;

/*!
 *  返回到指定的类视图
 *
 *  @param ClassName 类名
 *  @param animated  是否动画
 */
- (void)ba_popToAppointViewController:(NSString *)ClassName animated:(BOOL)animated;

@end
