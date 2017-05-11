/* !:
 * @FileName   :   LoginProtocolImpl.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/10.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "LoginProtocolImpl.h"

@interface LoginProtocolImpl ()

/**
 *  model数据
 */
@property (strong, nonatomic) NSMutableDictionary *userData;

@end

@implementation LoginProtocolImpl

-(RACSignal *)requestLogionDataSignal:(NSString *)requestUrl params:(NSDictionary *)params{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
//        HTURLSessionTask *task = [HTNetWorking getWithUrl:requestUrl refreshCache:YES showHUD:@"loading..." params:params success:^(id response) {
//            
//            
//            
//            [subscriber sendNext:self.userData];
//            [subscriber sendCompleted];
//            
//        } fail:^(NSError *error) {
//            [subscriber sendError:error];
//        }];
        
        [subscriber sendNext:@"yes"];
        [subscriber sendCompleted];
        

        
        return [RACDisposable disposableWithBlock:^{
            
//            [task cancel];
        }];
    }];
}

- (RACSignal *)requestLogionCodeDataSignal:(NSString *)requestUrl params:(NSDictionary *)params{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
//        HTURLSessionTask *task = [HTNetWorking getWithUrl:requestUrl refreshCache:YES showHUD:@"loading..." params:params success:^(id response) {
//            
//            
//            [subscriber sendNext:self.userData];
//            [subscriber sendCompleted];
//            
//        } fail:^(NSError *error) {
//            [subscriber sendError:error];
//        }];
        
        [subscriber sendNext:@"sdfa"];
        [subscriber sendCompleted];
        
        
        return [RACDisposable disposableWithBlock:^{
            
//            [task cancel];
        }];
    }];
}

@end
