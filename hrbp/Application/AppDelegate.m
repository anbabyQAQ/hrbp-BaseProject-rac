/* !:
 * @FileName   :   TAppDelegate.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/4.
 * @Copyright  :   Copyright © 2017年 tyl. All rights reserved.
 */

#import "AppDelegate.h"
#import "HTTabBarControllerConfig.h"
#import "HTServerConfig.h"
#import <IQKeyboardManager.h>
#import "HTLBSManager.h"
#import "HTServerConfig.h"
#import "LoginViewController.h"
#import "ConfigBaseNavigationViewController.h"
#import "HRLoginViewModel.h"
#import "HTViewModelServicesImpl.h"

@interface AppDelegate ()

@property (assign , nonatomic , readwrite) ReachabilityStatus  NetWorkStatus;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    // 设置跟控制器
    [self setRootController];
    // 设置服务器环境 01:生产环境  00:测试环境
    [HTServerConfig setHTConfigEnv:@"01"];

    // 配置IQKeyboardManager
    [self configurationIQKeyboard];
    // 获取定位信息
    /*
    self.lbs = [HTLBSManager startGetLBSWithDelegate:self];
     */
    // 配置网络状态
    [self configurationNetWorkStatus];
    
    
    return YES;
}

#pragma mark -
#pragma mark - Private Methods
//// 配置Scheme和Host
//- (void)configurationAppSchemeAndHost
//{
//    [VKURLAction setupScheme:@"HeartTrip" andHost:@"NativeOpenUrl"];
//    [VKURLAction enableSignCheck:@"BinBear"];
//}
// 设置根控制器
- (void)setRootController
{
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    BOOL isLogin = [BA_UserDefault objectForKey:FirstLogin];
    if (!isLogin) {
        //登录处理
        // 数据服务
        HTViewModelServicesImpl *viewModelService = [[HTViewModelServicesImpl alloc] initModelServiceImpl];
        HRLoginViewModel *loginViewModel = [[HRLoginViewModel alloc] initWithServices:viewModelService params:nil];
        LoginViewController *loginVC = [[LoginViewController alloc]initWithViewModel:loginViewModel];
        ConfigBaseNavigationViewController *navController = [[ConfigBaseNavigationViewController alloc] initWithRootViewController:loginVC];
        self.window.rootViewController = navController;
    }else{
        /********* tabbar普通样式  ***********/
        HTTabBarControllerConfig *tabBarControllerConfig = [[HTTabBarControllerConfig alloc] init];
        [self.window setRootViewController:tabBarControllerConfig.tabBarController];
    }

    [self.window makeKeyAndVisible];
}

// 配置IQKeyboardManager
- (void)configurationIQKeyboard
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;
}

- (void)configurationNetWorkStatus
{
    
    [GLobalRealReachability startNotifier];
    
    RAC(self, NetWorkStatus) = [[[[[[NSNotificationCenter defaultCenter]
                                    rac_addObserverForName:kRealReachabilityChangedNotification object:nil]
                                   map:^(NSNotification *notification) {
                                       return @([notification.object currentReachabilityStatus]);
                                   }]
                                  takeUntil:self.rac_willDeallocSignal]
                                 startWith:@([GLobalRealReachability currentReachabilityStatus])]
                                distinctUntilChanged];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
