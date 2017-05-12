/* !:
 * @FileName   :   LoginViewController.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/10.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "LoginViewController.h"
#import "HRLoginViewModel.h"

@interface LoginViewController ()

/** scrollView*/
@property (strong, nonatomic) UIScrollView *myScrollView;

/** 账号图标*/
@property (strong, nonatomic) UIImageView *accountImage;
/** 密码图标*/
@property (strong, nonatomic) UIImageView *PswImage;
/** 第一条分割线*/
@property (strong, nonatomic) UIView *firstSegLine;
/** 第二条分割线*/
@property (strong, nonatomic) UIView *secondSegLine;

/** 用户名输入框*/
@property (nonatomic, strong) BATextField *tfName;
/** 登录按钮*/
@property (strong, nonatomic) UIButton *btLogin;
/** 获取短信码按钮*/
@property (strong, nonatomic) UIButton *btPsw;
/** 密码输入框*/
@property (nonatomic, strong) BATextField *tfPsw;

/** 判断是否离线模式*/
@property (nonatomic, assign) BOOL isOffLine;

/**
 *   ViewModel
 */
@property (strong, nonatomic, readonly) HRLoginViewModel *viewModel;

@property (nonatomic, assign) NSInteger remainSeconds;

@property (nonatomic, assign) NSInteger startCheckTimer;

@end

@implementation LoginViewController
@dynamic viewModel;
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.tfPsw.text = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:BA_ImageName(@"backImade")];
    self.tfName.phoneRestrict = YES;
    self.tfName.textfieldStyle = BATextfieldStylePhone;
    
    @weakify(self);
    RAC(self.viewModel, username) = self.tfName.rac_textSignal;
    RAC(self.viewModel, password) = self.tfPsw.rac_textSignal;

//    [self.viewModel.connectionErrors subscribeNext:^(NSError *error) {
//        NSLog(@"错误了，给个提示 error is %@",error);
//        [BAAlertView showTitle:@"提示" message:@"错误了，给个提示"];
//    }];
//    
//    [self.viewModel.codeErrors subscribeNext:^(NSError *error) {
//        NSLog(@"错误了，给个提示 error is %@",error);
//        [BAAlertView showTitle:@"提示" message:@"错误了，给个提示"];
//    }];
    
    RAC(self.btLogin, enabled) = self.viewModel.loginEnableSignal;

    
    RAC(self.btLogin, backgroundColor) = [self.viewModel.loginEnableSignal map:^id(NSNumber *valid) {
        return [valid boolValue] ? [UIColor colorWithHexString:@"E66440" alpha:0.6] : KRGBA(254, 170, 151, 0.6);
    }];

    
    [[[self.btLogin rac_signalForControlEvents:UIControlEventTouchUpInside]
      doNext:^(id x) {
          @strongify(self);
          [self.view endEditing:YES];
          self.btLogin.enabled = NO;
      }]
     subscribeNext:^(id x) {
         @strongify(self);
         self.btLogin.enabled = YES;
         if (![self.viewModel isValidPhoneNumber:self.tfName.text]) {
             [BAAlertView showTitle:@"提 示" message:@"查看输入电话号码格式是否正确！"];
         }else{
             [self.viewModel.loginCommand execute:@2];
         }
     }];
    
    [[[self.btPsw rac_signalForControlEvents:(UIControlEventTouchUpInside)]
       doNext:^(id x) {
           @strongify(self);
           self.remainSeconds = 60;
           self.startCheckTimer = 1;
           self.btPsw.enabled = NO;
           self.btPsw.backgroundColor = KRGBA(254, 170, 151, 0.6);
       }]
     subscribeNext:^(NSNumber *x) {
         @strongify(self);
         self.btPsw.enabled = YES;
         self.btPsw.backgroundColor = [UIColor colorWithHexString:@"E66440" alpha:0.6];
         if (![self.viewModel isValidPhoneNumber:self.tfName.text]) {
             [BAAlertView showTitle:@"提 示" message:@"查看输入电话号码格式是否正确！"];
         }else{
             [self.viewModel.codeCommand execute:@2];
         }
     }];
    
    [self.viewModel.codeCommand.executionSignals.switchToLatest subscribeNext:^(NSString *value) {
        @strongify(self)
        if (value) {
            // 60s倒计时
            [self setCountdownTime];
        }
    }];
}

- (void)setCountdownTime{
    self.btPsw.enabled = NO;
    RACSignal *codeTitleSignal = [[[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]]
                                   take:self.remainSeconds+1]
                                  map:^id(NSDate* value) {
                                      NSString *text;
                                      if(self.remainSeconds > 0 && self.startCheckTimer){
                                          self.remainSeconds = self.remainSeconds - 1;
                                          if(self.remainSeconds == 0){
                                              self.startCheckTimer = 0;
                                          }
                                          text = [NSString stringWithFormat:@"%lds重新获取",self.remainSeconds];
                                      }else{
                                          text  = [NSString stringWithFormat:@"获取验证码"];
                                          self.btPsw.enabled = YES;
                                          self.btPsw.backgroundColor = [UIColor colorWithHexString:@"E66440" alpha:0.6];
                                      }
                                      return text;
                                  }];
    [codeTitleSignal subscribeNext:^(id x) {
        [self.btPsw setTitle:x forState:(UIControlStateNormal)];
    }];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.myScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
    [self.accountImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(SCREEN_HEIGHT/3);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(28);
        make.height.mas_equalTo(28);
    }];
    
    [self.tfName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.accountImage);
        make.left.mas_equalTo(self.accountImage.mas_right).offset(20);
        make.width.mas_equalTo(BA_SCREEN_WIDTH - 200);
        make.height.mas_equalTo(30);
    }];
    
    [self.firstSegLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tfName.mas_bottom).offset(1);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(BA_SCREEN_WIDTH-30);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.PswImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.firstSegLine.mas_bottom).offset(30);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(28);
        make.height.mas_equalTo(28);
    }];
    
    [self.tfPsw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.PswImage.mas_top);
        make.left.mas_equalTo(self.PswImage.mas_right).offset(20);
        make.width.mas_equalTo(BA_SCREEN_WIDTH - 200);
        make.height.mas_equalTo(30);
    }];
    
    [self.btPsw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tfPsw.mas_top);
        make.right.mas_equalTo(self.view.mas_right).offset(-15);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    [self.secondSegLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tfPsw.mas_bottom).mas_offset(1);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(self.btPsw.mas_left).offset(-10);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.btLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btPsw.mas_bottom).offset(35);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(BA_SCREEN_WIDTH - 40);
        make.height.mas_equalTo(44);
    }];
    
    self.myScrollView.contentSize = CGSizeMake(BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT+10);
    
}

- (UIScrollView *)myScrollView{
    return HT_LAZY(_myScrollView, ({
        UIScrollView *myScrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        myScrollView.showsVerticalScrollIndicator = NO;
        myScrollView.showsHorizontalScrollIndicator = NO;
        myScrollView.backgroundColor = BA_Clear_Color;
        [self.view addSubview:myScrollView];
        
        myScrollView;
    }));
}

- (UIImageView *)accountImage{
    return HT_LAZY(_accountImage, ({
        UIImageView *iconImageView = [[UIImageView alloc] init];
        iconImageView.backgroundColor = BA_Clear_Color;
        iconImageView.image = [UIImage imageNamed:@"root_tab_me_hl_25x25_"];
        iconImageView.layer.masksToBounds = YES;
        iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        iconImageView.layer.cornerRadius = 6.f;
        [self.myScrollView addSubview:iconImageView];
    
        iconImageView;
    }));
}

- (UIImageView *)PswImage{
    return HT_LAZY(_PswImage, ({
        UIImageView *iconImageView = [[UIImageView alloc] init];
        iconImageView.backgroundColor = BA_Clear_Color;
        iconImageView.image = [UIImage imageNamed:@"root_tab_msg_hl_25x25_"];
        iconImageView.layer.masksToBounds = YES;
        iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        iconImageView.layer.cornerRadius = 6.f;
        [self.myScrollView addSubview:iconImageView];
        
        iconImageView;
    }));
}

- (BATextField *)tfName{
    return HT_LAZY(_tfName, ({
        BATextField *tfName = [[BATextField alloc] init];
        tfName.textColor = BA_White_Color;
        tfName.placeholder = @"请输入手机号";
        tfName.keyboardType = UIKeyboardTypeNumberPad;
        tfName.font = BA_FontSize(16);
        tfName.clearButtonMode  = UITextFieldViewModeWhileEditing;
        [self.myScrollView addSubview:tfName];
    
        tfName;
    }));
}

- (BATextField *)tfPsw{
    return HT_LAZY(_tfPsw, ({
        BATextField *tfPsw = [[BATextField alloc] init];
        tfPsw.textColor = BA_White_Color;
        tfPsw.placeholder = @"请输入验证码";
        tfPsw.keyboardType = UIKeyboardTypeNumberPad;
        tfPsw.clearButtonMode  = UITextFieldViewModeWhileEditing;
        tfPsw.font = BA_FontSize(16);
        [self.myScrollView addSubview:tfPsw];
        
        tfPsw;
    }));
}

-(UIView *)firstSegLine{
    return HT_LAZY(_firstSegLine, ({
        UIView *firstSegLine = [[UIView alloc] init];
        firstSegLine.backgroundColor = BA_White_Color;
        [self.myScrollView addSubview:firstSegLine];
    
        firstSegLine;
    }));
}

-(UIView *)secondSegLine{
    return HT_LAZY(_secondSegLine, ({
        UIView *secondSegLine = [[UIView alloc] init];
        secondSegLine.backgroundColor = BA_White_Color;
        [self.myScrollView addSubview:secondSegLine];
        
        secondSegLine;
    }));
}

- (UIButton *)btPsw{
    return HT_LAZY(_btPsw, ({
        UIButton *btPsw = [UIButton buttonWithType:UIButtonTypeCustom];
        btPsw.backgroundColor = [UIColor colorWithHexString:@"E66440" alpha:0.6];
        [btPsw setTitle:@"获取验证码" forState:(UIControlStateNormal)];
        btPsw.titleLabel.font = [UIFont systemFontOfSize:16];
        [btPsw setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        btPsw.layer.cornerRadius = 3.f;
        [self.myScrollView addSubview:btPsw];
    
        btPsw;
    }));
}

- (UIButton *)btLogin{
    return HT_LAZY(_btLogin, ({
        UIButton *btLogin = [UIButton buttonWithType:UIButtonTypeCustom];
//        btLogin.backgroundColor = [UIColor colorWithHexString:@"E66440" alpha:0.6];
        btLogin.backgroundColor = KRGBA(254, 170, 151, 0.6);
        [btLogin setTitle:@"登 录" forState:(UIControlStateNormal)];
        [btLogin setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        btLogin.titleLabel.font = [UIFont systemFontOfSize:18];
        btLogin.layer.cornerRadius = 3.f;
        [self.myScrollView addSubview:btLogin];

        btLogin;
    }));
}

@end
