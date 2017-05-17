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



//登录
- (RACSignal *)requestLoginDataSignal:(NSString *)requestUrl params:(NSDictionary *)params;
//登录用户权限
- (RACSignal *)requestLoginAuthInfoDataSignal:(NSString *)requestUrl params:(NSDictionary *)params;
//获取登录验证码
- (RACSignal *)requestLoginCodeDataSignal:(NSString *)requestUrl params:(NSDictionary *)params;



//native->get数据请求
- (RACSignal *)requestNativeGetDataSignal:(NSString *)requestUrl params:(NSDictionary *)params;
//native->post数据请求
- (RACSignal *)requestNativePostDataSignal:(NSString *)requestUrl params:(NSDictionary *)params;




@end
