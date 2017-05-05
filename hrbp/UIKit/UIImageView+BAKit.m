//
//  UIImageView+BAKit.m
//  BaseProject
//
//  Created by tyl on 2017/4/25.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import "UIImageView+BAKit.h"

#define BA_placeHolder_Image @"placeHolder"


@implementation UIImageView (BAKit)

/* 给定图片、框架初始化UIImageView */
+ (id)initWithImage:(UIImage *)image
              frame:(CGRect)rect
{
    UIImageView *_image = [[UIImageView alloc] init];
    [_image setFrame:rect];
    [_image setImage:image];
    return _image;
}

/* 给定图片、尺寸、中心点初始化UIImageView */
+ (id)initWithImage:(UIImage *)image
               size:(CGSize)size
             center:(CGPoint)center
{
    UIImageView *_image = [[UIImageView alloc] init];
    [_image setFrame:CGRectMake(0, 0, size.width, size.height)];
    [_image setImage:image];
    [_image setCenter:center];
    return _image;
}

+ (UIImageView *)addImgWithFrame:(CGRect)frame AndImage:(NSString *)imgName
{
    UIImageView *imgView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:imgName]];
    
    imgView.frame = frame;
    return imgView;
}

- (void)ba_setImageWithURL:(NSURL *)url
{
    [self sd_setImageWithURL:url];
}

- (void)ba_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self sd_setImageWithURL:url placeholderImage:placeholder];
}

- (void)ba_setHeardWithUrl:(NSString *)hearUrl
{
    UIImage *placeHolder = [[UIImage imageNamed:BA_placeHolder_Image] ba_circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:hearUrl] placeholderImage:placeHolder options:0 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image ? [image ba_circleImage] : placeHolder;
    }];
}

@end
