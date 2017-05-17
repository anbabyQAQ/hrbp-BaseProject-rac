/* !:
 * @FileName   :   HTWebViewModel.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HTWebViewModel.h"
#import "RegionalModel.h"
#import "UserModel.h"

@interface HTWebViewModel ()

@end

@implementation HTWebViewModel

- (instancetype)initWithServices:(id<HTViewModelService>)services params:(NSDictionary *)params
{
    if (self = [super initWithServices:services params:params]) {
        
        _requestURL = params[RequestURLkey];
        _webType = [params[WebViewTypekey] unsignedIntegerValue];
    }
    return self;
}

- (void)initialize{
    
    [super initialize];

    @weakify(self);
    RACSignal *urlChanged = [RACObserve(self, JSUrl) skip:2];
    
    [urlChanged subscribeNext:^(NSString *visible) {
        _JSUrl = visible;
    }];
    
    
    RACSignal *paramsChanged = [RACObserve(self, params) skip:2];
    
    [paramsChanged subscribeNext:^(NSString *x) {
        _params = x;
    }];
    
    
    self.requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input)  {
        @strongify(self);
        
        return [[[self.services getWebService] requestNativeGetDataSignal:_JSUrl params:[self.params jsonValueDecoded]] doNext:^(id  _Nullable result) {

        }];
    }];
    
    self.userInfoCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input)  {
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
           
            RegionalModel *model = RegionalModelSHARE;
            model.baseInfo = USERSHARE;
            
            NSDictionary *dic_param = [model mj_keyValues];//模型转字典
            NSString     *str_param = [dic_param dictionaryToJson];
            
            [subscriber sendNext:str_param];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}

@end
