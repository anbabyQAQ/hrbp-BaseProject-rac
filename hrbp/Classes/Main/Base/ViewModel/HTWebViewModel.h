/* !:
 * @FileName   :   HTWebViewModel.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HTViewModel.h"

typedef NS_ENUM(NSUInteger, HTWebType) {
    
    kWebHomeFullviewDetailType                           = 1, // 首页全景试图详情
    kWebHomePersonnelFlowDetailType                      = 2, // 首页人员流动分析
    kWebHomePersonnelWorkingEfficiencyDetailType         = 3, // 首页员工工作效率评估
    kWebHomePersonnelStandardDetailType                  = 4, // 首页员工规范
    
};

@interface HTWebViewModel : HTViewModel
/**
 *  请求地址
 */
@property (copy, nonatomic) NSString *requestURL;
/**
 *  web页面类型
 */
@property (assign , nonatomic) HTWebType webType;


/**
 *  JSURL
 */
@property (strong , nonatomic) NSString  *JSUrl;
/**
 *  JSparams
 */
@property (strong , nonatomic) NSString  *params;
/**
 *  网络请求
 */
@property (strong, nonatomic) RACCommand *requestCommand;
/**
 *  用户基本信息以及权限信息 回调
 */
@property (strong, nonatomic) RACCommand *userInfoCommand;

- (instancetype)initWithServices:(id<HTViewModelService>)services params:(NSDictionary *)params;

@end
