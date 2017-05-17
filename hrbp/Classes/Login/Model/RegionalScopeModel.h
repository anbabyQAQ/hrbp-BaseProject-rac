/* !:
 * @FileName   :   RegionalScopeModel.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/16.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface RegionalScopeModel : NSObject

/*
{
    "region1": 连云港市,
    "region2": 海州区,
    "region3": 海州街道、幸福路街道、朐阳街道、洪门街道、新坝镇、锦屏镇、板浦镇、宁海街道、浦东街道、浦西街道、新东街道、新南街道、路南街道、新海街道、花果山街道、南城街道、云台街道、浦南镇；云台农场、南云台林场、岗埠农场
    
},
 */

@property (nonatomic, strong) NSString *region1;
@property (nonatomic, strong) NSString *region2;
@property (nonatomic, strong) NSString *region3;


@end
