//
//  BALoadingHubView.h
//  BaseProject
//
//  Created by tyl on 2017/4/24.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BALoadingHubView : UIView
/** 球的颜色 */
@property (nonatomic,strong) UIColor *ballColor;

/** 展示加载动画*/
- (void)showHub;

/**
 *  关闭加载动画
 */
- (void)dismissHub;
@end
