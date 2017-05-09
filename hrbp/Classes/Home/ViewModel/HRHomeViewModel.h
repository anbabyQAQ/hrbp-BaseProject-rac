/* !:
 * @FileName   :   HRHomeViewModel.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "HTViewModel.h"

@interface HRHomeViewModel : HTViewModel

/**
 *  错误信号
 */
@property (strong, nonatomic) RACSignal *travelConnectionErrors;
/**
 *  导航栏rightBar
 */
@property (strong, nonatomic) RACCommand *rightBarButtonItemCommand;
/**
 *  详情
 */
@property (strong, nonatomic) RACCommand *detailCommand;
/**
 *  游记数据
 */
@property (strong, nonatomic) NSArray *travelData;
/**
 *  banner数据
 */
@property (strong, nonatomic) NSArray *bannerData;



@end
