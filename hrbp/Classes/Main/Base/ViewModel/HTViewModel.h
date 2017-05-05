/* !:
 * @FileName   :   HTViewModel.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "HTViewModelService.h"


typedef NS_ENUM(NSUInteger, HTNavBarStyleType) {
    
    kNavBarStyleNomal   = 0, // 默认
    kNavBarStyleHidden  = 1, // 隐藏
    
};

@interface HTViewModel : NSObject
/**
 *  数据请求
 */
@property (strong, nonatomic, readonly) RACCommand *requestDataCommand;
/**
 *  网络状态
 */
@property (assign, nonatomic) ReachabilityStatus  netWorkStatus;
/**
 *  NavBar类型
 */
@property (assign, nonatomic, readonly) HTNavBarStyleType navBarStyleType;
/**
 *  标题
 */
@property (copy, nonatomic, readonly) NSString *title;
/**
 *  viewModel服务
 */
@property (strong, nonatomic, readonly) id<HTViewModelService> services;

- (instancetype)initWithServices:(id<HTViewModelService>)services params:(NSDictionary *)params;
- (void)initialize;

- (RACSignal *)executeRequestDataSignal:(id)input;

@end
