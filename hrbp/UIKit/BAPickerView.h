//
//  BAPickerView.h
//  BaseProject
//
//  Created by tyl on 2017/4/25.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BAPickerViewDelegate <NSObject>

/*! 代理方法1：获取选择的城市 */
- (void)getSelectCity:(NSString *)city;

@end

@interface BAPickerView : UIView

@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *area;

@property (nonatomic, weak) id<BAPickerViewDelegate> delegate;

/*!
 *  显示pickView
 *
 *  @param view 在哪里显示
 */
- (void)showInView:(UIView *)view;

/*!
 *  隐藏pickView
 */
- (void)hiddenPickerView;

/*!
 *  获取的城市名字
 *
 *  @param string 城市名字
 *
 *  @return 返回城市名字
 */
- (NSString *)protectString:(NSString *)string;

@end
