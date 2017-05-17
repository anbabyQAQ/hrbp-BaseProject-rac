/* !:
 * @FileName   :   WebViewProtocolImpl.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "WebViewProtocolImpl.h"

@implementation WebViewProtocolImpl

- (RACSignal *)requestNativeGetDataSignal:(NSString *)requestUrl params:(NSDictionary *)params{
 
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        HTURLSessionTask *task = [HTNetWorking getWithUrl:requestUrl refreshCache:YES showHUD:@"loading..." params:nil success:^(id response) {
            
            NSDictionary *responseDic = response;
            NSNumber* num_code=[DataUtil numberForKey:@"code" inDictionary:responseDic];
            NSInteger code=[num_code integerValue];
            if(code==200){
                NSArray *data = [DataUtil arrayForKey:@"data" inDictionary:responseDic];
                
            }
            [subscriber sendNext:response];
            [subscriber sendCompleted];
            
        } fail:^(NSError *error) {
            [subscriber sendError:error];
        }];
     
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (RACSignal *)requestNativePostDataSignal:(NSString *)requestUrl params:(NSDictionary *)params{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        HTURLSessionTask *task = [HTNetWorking postWithUrl:requestUrl refreshCache:YES showHUD:@"loading..." params:params success:^(id response) {
            
            NSDictionary *responseDic = response;
            NSNumber* num_code=[DataUtil numberForKey:@"code" inDictionary:responseDic];
            NSInteger code=[num_code integerValue];
            if(code==200){
                NSArray *data = [DataUtil arrayForKey:@"data" inDictionary:responseDic];
                
            }
            [subscriber sendNext:response];
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
