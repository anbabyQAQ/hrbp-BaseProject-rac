//
//  BATextView.m
//  BaseProject
//
//  Created by tyl on 2017/4/25.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import "BATextView.h"

@implementation BATextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addObserver];
    }
    return self;
}

- (id)init
{
    if (self = [super init])
    {
        [self addObserver];
    }
    return self;
}

- (void)addObserver
{
    // 注册通知
    [BA_NotiCenter addObserver:self selector:@selector(didBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:self];
    [BA_NotiCenter addObserver:self selector:@selector(didEndEditing:) name:UITextViewTextDidEndEditingNotification object:self];
    [BA_NotiCenter addObserver:self selector:@selector(terminate:) name:UIApplicationWillTerminateNotification object:BASharedApplication];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.text = placeholder;
    self.textColor = self.placeholderTextColor;
}

- (void)terminate:(NSNotification *)notification
{
    // 移除通知
    [BA_NotiCenter removeObserver:self];
}

- (void)didBeginEditing:(NSNotification *)notification
{
    if ([self.text isEqualToString:self.placeholder])
    {
        BALog(@"开始编辑！")
        self.text = @"";
        self.textColor = [UIColor blackColor];
    }
}

- (void)didEndEditing:(NSNotification *)notification
{
    if (self.text.length < 1)
    {
        BALog(@"结束编辑！")
        self.text = self.placeholder;
        self.textColor = [UIColor grayColor];
    }
}

@end
