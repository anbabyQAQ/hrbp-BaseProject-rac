/* !:
 * @FileName   :   HRLoginViewModel.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/10.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HRLoginViewModel.h"

@implementation HRLoginViewModel

- (instancetype)initWithServices:(id<HTViewModelService>)services params:(NSDictionary *)params{
    
    if (self = [super initWithServices:services params:params]) {
        _userData = [NSArray new];
    }
    return self;
}

- (void)initialize{
    
    [super initialize];
    
   
    @weakify(self);
    self.usernameSignal = [[RACObserve(self, username)
                           map:^id(NSString * text) {
                               @strongify(self);
                               return @([self isValidUsername:text]);
                           }] distinctUntilChanged];
    
    self.passwordSignal = [[RACObserve(self, password)
                            map:^id(NSString *text) {
                                @strongify(self);
                                return @([self isValidPassword:text]);
                            }] distinctUntilChanged];
    
    self.loginEnableSignal = [RACSignal combineLatest:@[self.usernameSignal, self.passwordSignal] reduce:^id(NSNumber*usernameValid, NSNumber *passwordValid){
        return @([usernameValid boolValue] && [passwordValid boolValue]);
    }];
    

    self.loginCommand = [[RACCommand alloc] initWithEnabled:self.loginEnableSignal signalBlock:^RACSignal * _Nonnull(id  _Nullable input)  {
        @strongify(self);
     
        NSDictionary *params = @{@"userAccountNum":self.username,@"verifCode":self.password,@"apiKey":@"1c22a4dc-fce6-4b22-ae4a-3a0f3031bbcd"};
        return [[[self.services getLoginService] requestLogionDataSignal:Login_URL params:params] doNext:^(id  _Nullable result) {

            [self pushTabbarController];
        }];
    }];
    
    self.codeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input)  {
        @strongify(self);
        
        NSDictionary *params = @{@"phoneNum":self.username,@"apiKey":@"1c22a4dc-fce6-4b22-ae4a-3a0f3031bbcd"};
        return [[[self.services getLoginService] requestLogionCodeDataSignal:VerifCode_URL params:params] doNext:^(id _Nullable result) {
            
            NSLog(@"%@",result);
            self.verifCode = result;

        }];
    }];

    
    _connectionErrors = _loginCommand.errors;
    _codeErrors       = _codeCommand.errors;
        
}

// 这两个判断都属于逻辑范畴，和UI无关
- (BOOL)isValidUsername:(NSString *)username {
    
    return username.length == 13;
}
- (BOOL)isValidPassword:(NSString *)password {
    return password.length == 6;
}

- (BOOL)isValidPhoneNumber:(NSString *)phoneNumber{
    //保留纯数字 ： [phoneNumber ba_removeStringSaveNumber]
    return  [BARegularExpression ba_isPhoneNumber:[phoneNumber ba_removeStringSaveNumber]];
}

- (void)pushTabbarController {
    self.password = nil;
    [UIView transitionFromView:APPDelegate.window.rootViewController.view
                        toView:APPDelegate.tabBarControllerConfig.tabBarController.view
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCurlUp
                    completion:^(BOOL finished)
     {
         [APPDelegate.window setRootViewController:APPDelegate.tabBarControllerConfig.tabBarController];
     }];

}

@end
