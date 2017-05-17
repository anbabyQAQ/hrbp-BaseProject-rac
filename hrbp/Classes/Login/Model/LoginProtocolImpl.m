/* !:
 * @FileName   :   LoginProtocolImpl.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/10.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "LoginProtocolImpl.h"
#import "UserModel.h"
#import "RegionalModel.h"

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

-(RACSignal *)requestLoginDataSignal:(NSString *)requestUrl params:(NSDictionary *)params{
    
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
        self.usermodel.province  = @"北京";
        [subscriber sendNext:self.usermodel];
        [subscriber sendCompleted];

        return [RACDisposable disposableWithBlock:^{
//            [task cancel];
        }];
    }];
}

- (RACSignal *)requestLoginCodeDataSignal:(NSString *)requestUrl params:(NSDictionary *)params{
    
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

- (RACSignal *)requestLoginAuthInfoDataSignal:(NSString *)requestUrl params:(NSDictionary *)params{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       
//        HTURLSessionTask *task = [HTNetWorking getWithUrl:requestUrl refreshCache:YES showHUD:@"获取权限" params:params success:^(id response) {
//        
//            NSDictionary *responseDic = response;
//            NSNumber* num_code=[DataUtil numberForKey:@"code" inDictionary:responseDic];
//            NSInteger code=[num_code integerValue];
//            if(code==200){
//                NSArray *data = [DataUtil arrayForKey:@"data" inDictionary:responseDic];
//                if (data.firstObject) {
//                    RegionalModel *model = [RegionalModel mj_objectWithKeyValues:data.firstObject];
//                }
//            }
//            
//            
//            [subscriber sendNext:response];
//            [subscriber sendCompleted];
//            
//        } fail:^(NSError *error) {
//            [subscriber sendError:error];
//        }];
        
        //         --- 模拟加载延迟
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@1];
            [subscriber sendCompleted];
        });
        
        return [RACDisposable disposableWithBlock:^{
//            [task cancel];
        }];
    }];
}

@end
