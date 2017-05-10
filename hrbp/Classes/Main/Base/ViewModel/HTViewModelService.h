//
//  HTViewModelService.h
//  hrbp
//
//  Created by tyl on 2017/5/5.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTViewModelProtocolImpl.h"

@protocol HTViewModelService <NSObject>


// 获取首页服务
- (id<HTViewModelProtocolImpl>) getHomeService;

// 获取消息服务
- (id<HTViewModelProtocolImpl>) getMessageService;

// 获取我的服务
- (id<HTViewModelProtocolImpl>) getMineService;



// 获得web服务
- (id<HTViewModelProtocolImpl>)getWebService;


// 获取登录服务
- (id<HTViewModelProtocolImpl>) getLoginService;

@end
