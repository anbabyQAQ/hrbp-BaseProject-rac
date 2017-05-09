/* !:
 * @FileName   :   HRMineViewModel.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "HTViewModel.h"

@interface HRMineViewModel : HTViewModel
/**
 *  错误信号
 */
@property (strong, nonatomic) RACSignal *travelConnectionErrors;
/**
 *  关于、版本检测
 */
@property (strong, nonatomic) RACCommand *detailCommand;
/**
 *  数据
 */
@property (strong, nonatomic) NSArray *userData;
/**
 *  退出登录
 */
@property (strong, nonatomic) RACCommand *logoutCommand;




@end
