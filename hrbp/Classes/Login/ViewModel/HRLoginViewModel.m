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
    
    self.remainSeconds = 60;
    self.startCheckTimer = 1;
    
   
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
    
    self.codeEnableSignal = [[RACObserve(self, remainSeconds)
                              map:^id(NSNumber *text) {
                                  @strongify(self);
                                  return @([self isValidtime:text.integerValue]);
                              }] distinctUntilChanged];
    
    
    self.loginCommand = [[RACCommand alloc] initWithEnabled:self.loginEnableSignal signalBlock:^RACSignal * _Nonnull(id  _Nullable input)  {
        @strongify(self);
        return [[[self.services getLoginService] requestLogionDataSignal:nil params:nil] doNext:^(id  _Nullable result) {
            NSLog(@"%@",result);
        }];
    }];
    
 

    self.codeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        return [[[self.services getLoginService] requestLogionCodeDataSignal:nil params:nil] doNext:^(id _Nullable result) {
            
            NSLog(@"%@",result);
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

- (BOOL)isValidtime:(NSInteger )second{
    
    return second;
}


@end
