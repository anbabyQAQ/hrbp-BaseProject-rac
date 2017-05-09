/* !:
 * @FileName   :   HTTabBarControllerConfig.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HTTabBarControllerConfig.h"
#import "ConfigBaseNavigationViewController.h"
#import "HTViewModelServicesImpl.h"
#import "HRHomeViewController.h"
#import "HRMessageViewController.h"
#import "HRMineViewController.h"
#import "HRHomeViewModel.h"
#import "HRMineViewModel.h"

@interface HTTabBarControllerConfig ()

@property (nonatomic, readwrite, strong) HTCustomTabBarController *tabBarController;
/**
 *  数据服务
 */
@property (strong, nonatomic) HTViewModelServicesImpl *viewModelService;
/**
 *  首页viewModel
 */
@property (strong, nonatomic) HRHomeViewModel *homeViewModel;
/**
 *  我的viewModel
 */
@property (strong, nonatomic) HRMineViewModel *mineViewModel;


@end

@implementation HTTabBarControllerConfig
/**
 *  懒加载tabBarController
 *
 */
- (HTCustomTabBarController *)tabBarController
{
    return HT_LAZY(_tabBarController, ({
        
        HTCustomTabBarController *tabBarController = [HTCustomTabBarController tabBarControllerWithViewControllers:self.viewControllersForController tabBarItemsAttributes:self.tabBarItemsAttributesForController];
        
        // tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
        [self customizeTabBarAppearance:tabBarController];
        tabBarController;
    }));
}

- (NSArray *)viewControllersForController {
    
    // 数据服务
    self.viewModelService = [[HTViewModelServicesImpl alloc] initModelServiceImpl];
    
    // 首页
    self.homeViewModel = [[HRHomeViewModel alloc] initWithServices:self.viewModelService params:nil];
    HRHomeViewController *homeViewController = [[HRHomeViewController alloc] initWithViewModel:self.homeViewModel];
    ConfigBaseNavigationViewController *firstNavigationController = [[ConfigBaseNavigationViewController alloc]
                                                                   initWithRootViewController:homeViewController];
    
    // 我的
    self.mineViewModel = [[HRMineViewModel alloc] initWithServices:self.viewModelService params:nil];
    HRMineViewController *mineViewController = [[HRMineViewController alloc] initWithViewModel:self.mineViewModel];
    ConfigBaseNavigationViewController *secondNavigationController = [[ConfigBaseNavigationViewController alloc]
                                                                    initWithRootViewController:mineViewController];
    
    // 消息
    
    

    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController
                                 ];
    return viewControllers;
}


/**
 *  设置TabBarItem的属性，包括 title、Image、selectedImage。
 */
- (NSArray *)tabBarItemsAttributesForController{
    
    NSDictionary *dict1 = @{
                            HTTabBarItemTitle : @"首页",
                            HTTabBarItemImage : @"root_tab_recommand_25x25_",
                            HTTabBarItemSelectedImage : @"root_tab_recommand_hl_25x25_",
                            };

    NSDictionary *dict2 = @{
                            HTTabBarItemTitle : @"我的",
                            HTTabBarItemImage : @"root_tab_me_25x25_",
                            HTTabBarItemSelectedImage : @"root_tab_me_hl_25x25_",
                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2
                                       ];
    return tabBarItemsAttributes;
}

/**
 *  tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性的设置
 */
- (void)customizeTabBarAppearance:(HTCustomTabBarController *)tabBarController {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = SetColor(74, 189, 204);
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
