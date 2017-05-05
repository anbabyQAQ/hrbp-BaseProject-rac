/* !:
 * @FileName   :   HTViewModelServicesImpl.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HTViewModelServicesImpl.h"
#import "HRHomeProtocolImpl.h"
#import "HRMineProtocolImpl.h"
#import "HRMessageProtocolImpl.h"
#import "WebViewProtocolImpl.h"

@interface HTViewModelServicesImpl ()
/**
 *  首页数据服务
 */
@property (strong, nonatomic) HRHomeProtocolImpl *homeService;
/**
 *  消息数据服务
 */
@property (strong, nonatomic) HRMessageProtocolImpl *messageService;
/**
 *  我的数据服务
 */
@property (strong, nonatomic) HRMineProtocolImpl *mineService;

/**
 *  web服务
 */
@property (strong, nonatomic) WebViewProtocolImpl *wedService;

@end

@implementation HTViewModelServicesImpl

- (instancetype)initModelServiceImpl
{
    if (self = [super init]) {
        
        _homeService = [HRHomeProtocolImpl new];
        _messageService = [HRMessageProtocolImpl new];
        _mineService = [HRMineProtocolImpl new];
        _wedService = [WebViewProtocolImpl new];
    }
    return self;
}

- (id<HTViewModelProtocolImpl>)getHomeService{
    return self.homeService;
}

- (id<HTViewModelProtocolImpl>)getMessageService{
    return self.messageService;
}

-(id<HTViewModelProtocolImpl>)getMineService{
    return self.mineService;
}

- (id<HTViewModelProtocolImpl>)getWebService{
    return self.getWebService;
}


@end
