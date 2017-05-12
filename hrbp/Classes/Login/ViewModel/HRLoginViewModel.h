/* !:
 * @FileName   :   HRLoginViewModel.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/10.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HTViewModel.h"

@interface HRLoginViewModel : HTViewModel
/**
 *  登录错误信号
 */
@property (strong, nonatomic) RACSignal *connectionErrors;
/**
 *  验证码错误信号
 */
@property (strong, nonatomic) RACSignal *codeErrors;
/**
 *  验证码
 */
@property (strong, nonatomic) RACCommand *codeCommand;
/**
 *  数据
 */
@property (strong, nonatomic) NSArray *userData;
/**
 *  登录
 */
@property (strong, nonatomic) RACCommand *loginCommand;

// property
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

// signal
@property (nonatomic, strong) RACSignal *usernameSignal;
@property (nonatomic, strong) RACSignal *passwordSignal;
@property (nonatomic, strong) RACSignal *loginEnableSignal;

//验证码
@property (nonatomic, strong) NSString *verifCode;


- (BOOL)isValidPhoneNumber:(NSString *)phoneNumber;


@end
