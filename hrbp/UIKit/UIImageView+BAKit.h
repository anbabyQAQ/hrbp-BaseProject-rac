//
//  UIImageView+BAKit.h
//  BaseProject
//
//  Created by tyl on 2017/4/25.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

/**
 *  给UIImageView类添加许多有用的方法
 */
@interface UIImageView (BAKit)

/**
 *  给定图片、框架初始化UIImageView
 */
+ (id)initWithImage:(UIImage *)image
              frame:(CGRect)rect;

/**
 *  给定图片、尺寸、中心点初始化UIImageView
 */
+ (id)initWithImage:(UIImage *)image
               size:(CGSize)size
             center:(CGPoint)center;

#pragma mark - ***** 包装SDWebImage
- (void)ba_setImageWithURL:(NSURL *)url;

- (void)ba_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

/**
 *  对图片进行圆角处理
 *  当头像显示为原型图片时，直接传url
 */
- (void)ba_setHeardWithUrl:(NSString *)hearUrl;

@end
