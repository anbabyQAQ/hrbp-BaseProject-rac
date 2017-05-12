/* !:
 * @FileName   :   HRMineProtocolImpl.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HRMineProtocolImpl.h"

@interface HRMineProtocolImpl ()

//我的setting配置项
@property (nonatomic, strong) NSMutableArray *userdata;


//关于我们
@property (nonatomic, strong) NSString *aboutUs;

@end

@implementation HRMineProtocolImpl

- (RACSignal *)requestMineAboutUsDataSignal:(NSString *)requestUrl{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        
        self.aboutUs = @"UICollectionView 这个类是iOS6 新引进的API，它的布局更加灵活，简单来说就是多列的UITableView,那么UICollectionView的实现和UITableView的实现基本一样，也是存在datasource和delegate的，其中datasource为view提供数据源，告诉view要显示些什么东西以及如何显示它们，delegate提供一些样式的小细节以及用户交互的相应，除此之外UICollectionView还有一个不得不提的就是UICollectionViewLayout。";
        
        [subscriber sendNext:self.aboutUs];
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

- (RACSignal *)requestMineDataSignal:(NSString *)requestUrl{

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [self.userdata removeAllObjects];
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:@"关于我们" forKey:@"userConfiguration"];
        
        NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
        [dic2 setObject:@"版本检测" forKey:@"userConfiguration"];

     
        [self.userdata addObject:dic];
        [self.userdata addObject:dic2];
        
        [subscriber sendNext:self.userdata];
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];

}

- (NSMutableArray *)userdata{
    return HT_LAZY(_userdata, @[].mutableCopy);
}

@end
