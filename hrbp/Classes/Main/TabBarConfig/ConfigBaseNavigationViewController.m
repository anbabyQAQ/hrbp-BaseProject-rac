/* !:
 * @FileName   :   ConfigBaseNavigationViewController.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "ConfigBaseNavigationViewController.h"
#import "UIBarButtonItem+HTBarButtonCustom.h"
#import "UINavigationController+FDFullscreenPopGesture.h"


@interface ConfigBaseNavigationViewController ()

@end

@implementation ConfigBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - Public Method
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    [self setUpNavigationBarAppearance];
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.fd_interactivePopMaxAllowedInitialDistanceToLeftEdge = CGRectGetWidth([UIScreen mainScreen].bounds)/3;
        [self setUpCustomNavigationBarWithViewController:viewController];
    }
    [super pushViewController:viewController animated:YES];
}

#pragma mark - 设置全局的导航栏属性
- (void)setUpNavigationBarAppearance
{
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    NSDictionary *textAttributes = @{NSFontAttributeName:HTSetFont(@"Noteworthy-Bold", 18),
                                     NSForegroundColorAttributeName: BA_White_Color
                                     };
    
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    navigationBarAppearance.tintColor = [UIColor whiteColor];
    navigationBarAppearance.barTintColor = SetColor(31, 36, 47);
}
- (void)setUpCustomNavigationBarWithViewController:(UIViewController *)viewController
{
    UIBarButtonItem * item = [UIBarButtonItem itemWithTarget: self action:@selector(btnLeftBtn) image:@"icon_nav_back_white_19x18_"  selectImage:@"icon_nav_back_white_19x18_"];
    viewController.navigationItem.leftBarButtonItem = item;
}
- (void)btnLeftBtn
{
    [self popViewControllerAnimated:YES];
}
#pragma mark - UIStatusBar
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
