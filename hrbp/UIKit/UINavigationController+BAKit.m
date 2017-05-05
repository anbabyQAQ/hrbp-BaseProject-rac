//
//  UINavigationController+BAKit.m
//  BaseProject
//
//  Created by tyl on 2017/4/25.
//  Copyright © 2017年 tyl. All rights reserved.
//
#import "UINavigationController+BAKit.h"

static char shadowViewkey;
@implementation UINavigationController (BAKit)

- (UIImageView *)nav_shadowView
{
    return objc_getAssociatedObject(self, &shadowViewkey);
}

- (void)setNav_shadowView:(UIImageView *)nav_shadowView
{
    objc_setAssociatedObject(self, &shadowViewkey, nav_shadowView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)ba_showNavShadowView
{
    self.nav_shadowView.hidden = NO;
}

- (void)ba_hiddenNavShadowView
{
    self.nav_shadowView.hidden = YES;;
}

- (void)ba_popBackViewControllerCount:(NSInteger)backCount
{
    UIViewController *vc = [self ba_controllerByPopCount:backCount];
    if (vc != nil)
    {
        [self popToViewController:vc animated:YES];
    }
}

- (UIViewController *)ba_controllerByPopCount:(NSInteger)count
{
    __block UIViewController *vc = nil;
    NSInteger totalCount = self.viewControllers.count;
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (totalCount - 1 - idx == count)
        {
            vc = obj;
            *stop = YES;
        }
    }];
    return vc;
}

/**
 *  返回到指定的类视图
 *
 *  @param ClassName 类名
 *  @param animated  是否动画
 */
- (void)ba_popToAppointViewController:(NSString *)ClassName animated:(BOOL)animated
{
    id vc = [self ba_getCurrentViewControllerClass:ClassName];
    if(vc != nil && [vc isKindOfClass:[UIViewController class]])
    {
        [self popToViewController:vc animated:animated];
    }
}

/*!
 *  获得当前导航器显示的视图
 *
 *  @param ClassName 要获取的视图的名称
 *
 *  @return 成功返回对应的对象，失败返回nil;
 */
- (instancetype)ba_getCurrentViewControllerClass:(NSString *)ClassName
{
    Class classObj = NSClassFromString(ClassName);
    
    NSArray * szArray =  self.viewControllers;
    for (id vc in szArray) {
        if([vc isMemberOfClass:classObj])
        {
            return vc;
        }
    }
    return nil;
}


@end
