/* !:
 * @FileName   :   AppDelegate.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/4.
 * @Copyright  :   Copyright © 2017年 tyl. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import <RealReachability.h>
#import "HTTabBarControllerConfig.h"
#import "ConfigBaseNavigationViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
/**
 *  网络状态
 */
@property (assign , nonatomic , readonly) ReachabilityStatus         NetWorkStatus;

@property (strong , nonatomic ) HTTabBarControllerConfig            *tabBarControllerConfig;

@property (strong , nonatomic ) ConfigBaseNavigationViewController  *navController;


@end

