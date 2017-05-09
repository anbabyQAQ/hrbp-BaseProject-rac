/* !:
 * @FileName   :   HTViewModelProtocolImpl.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <Foundation/Foundation.h>

@protocol HTViewModelProtocolImpl <NSObject>

@optional
// 加载首页数据
- (RACSignal *)requestHomeDataSignal:(NSString *)requestUrl;

// 关于我们
- (RACSignal *)requestMineAboutUsDataSignal:(NSString *)requestUrl;

// 我的配置项
- (RACSignal *)requestMineDataSignal:(NSString *)requestUrl;

@end
