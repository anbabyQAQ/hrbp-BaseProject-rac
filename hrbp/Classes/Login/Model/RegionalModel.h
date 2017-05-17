/* !:
 * @FileName   :   RegionalModel.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/16.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "RegionalScopeModel.h"
#import "UserModel.h"

#define RegionalModelSHARE [RegionalModel sharedRegionalModel]


@interface RegionalModel : NSObject


/**
 * 地区权限
 */
@property(nonatomic ,strong) NSArray<RegionalScopeModel*> *regionalScope;

/**
 * postList
 */
@property(nonatomic ,strong) NSArray<NSString*>           *postList;
/**
 * postList
 */
@property(nonatomic ,strong) UserModel                    *baseInfo;

+ (RegionalModel *)sharedRegionalModel;


@end
