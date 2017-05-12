/* !:
 * @FileName   :   LoginProtocolImpl.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/10.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "LoginProtocolImpl.h"
#import "UserModel.h"

@interface LoginProtocolImpl ()

/**
 *  model数据
 */
@property (strong, nonatomic) UserModel *usermodel;

/**
 *  验证码
 */
@property (strong, nonatomic) NSString *verifCode;

@end

@implementation LoginProtocolImpl

-(RACSignal *)requestLogionDataSignal:(NSString *)requestUrl params:(NSDictionary *)params{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
//        HTURLSessionTask *task = [HTNetWorking getWithUrl:requestUrl refreshCache:YES showHUD:@"loading..." params:params success:^(id response) {
//            
//            NSDictionary *responseDic = response;
//            NSNumber* num_code=[DataUtil numberForKey:@"code" inDictionary:responseDic];
//            NSInteger code=[num_code integerValue];
//            if(code==200){
//                NSArray *data = [DataUtil arrayForKey:@"data" inDictionary:responseDic];
//                if (data.firstObject) {
//                    self.usermodel = [UserModel mj_objectWithKeyValues:data.firstObject];
//                    self.usermodel.authToken = [DataUtil stringForKey:@"authToken" inDictionary:responseDic];
//                     self.usermodel.refreshToken = [DataUtil stringForKey:@"refreshToken" inDictionary:responseDic];
//                }
//            }
//            [subscriber sendNext:self.usermodel];
//            [subscriber sendCompleted];
//            
//        } fail:^(NSError *error) {
//            [subscriber sendError:error];
//        }];
        
        self.usermodel = [[UserModel alloc]init];
        self.usermodel.name  = @"张三";
        self.usermodel.position  = @"冠华大厦-移动互联网事业部";
        [subscriber sendNext:self.usermodel];
        [subscriber sendCompleted];

        return [RACDisposable disposableWithBlock:^{
//            [task cancel];
        }];
    }];
}

- (RACSignal *)requestLogionCodeDataSignal:(NSString *)requestUrl params:(NSDictionary *)params{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        HTURLSessionTask *task = [HTNetWorking getWithUrl:requestUrl refreshCache:YES showHUD:@"loading..." params:params success:^(id response) {
            
            NSDictionary *responseDic = response;
            NSNumber* num_code=[DataUtil numberForKey:@"code" inDictionary:responseDic];
            NSInteger code=[num_code integerValue];
            if(code==200){
                NSArray *data = [DataUtil arrayForKey:@"data" inDictionary:responseDic];
                if (data.firstObject) {
                     self.verifCode = [DataUtil stringForKey:@"verifCode" inDictionary:responseDic];
                }
            }
            [subscriber sendNext:self.verifCode];
            [subscriber sendCompleted];
            
        } fail:^(NSError *error) {
            [subscriber sendError:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];

}

@end
