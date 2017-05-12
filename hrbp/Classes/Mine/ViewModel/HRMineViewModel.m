/* !:
 * @FileName   :   HRMineViewModel.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HRMineViewModel.h"
#import "HRMineAboutViewController.h"
#import "HRAboutUsViewModel.h"
#import "HTViewModelServicesImpl.h"
#import "HTMediatorAction+HRMineAboutViewController.h"

@implementation HRMineViewModel

- (instancetype)initWithServices:(id<HTViewModelService>)services params:(NSDictionary *)params{
    
    if (self = [super initWithServices:services params:params]) {
        _userData = [NSArray new];
    }
    return self;
}
- (void)initialize{
    
    [super initialize];
    
    _detailCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSString *flag = input[@"userConfiguration"];
        NSLog(@"%@",input);
        if ([flag isEqualToString:@"关于我们"]) {
            HTViewModelServicesImpl *servicesImpl = [[HTViewModelServicesImpl alloc] initModelServiceImpl];
            HRAboutUsViewModel *viewModel = [[HRAboutUsViewModel alloc] initWithServices:servicesImpl params:nil];
            [[HTMediatorAction sharedInstance] pushAboutUsControllerWithViewModel:viewModel];
        }
        if ([flag isEqualToString:@"版本检测"]) {
            
            [BAAlertView showTitle:@"提示" message:[NSString stringWithFormat:@"当前应用版本：v%@",[CommonUtils getAppVersion]]];
        }
    
        return [RACSignal empty];
        
    }];
    
    _logoutCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        [self showActionSheet];
        return [RACSignal empty];
    }];
}

- (RACSignal *)executeRequestDataSignal:(id)input
{
    return [[[self.services getMineService] requestMineDataSignal:nil] doNext:^(id  _Nullable result) {
        self.userData = result;
    }];
}

- (void)showActionSheet
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"温馨提示:" attributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]}];
    NSString *result = @"是否退出登录?";
    
    /*! 关键字添加效果 */
    NSMutableAttributedString *attributedMessage = [[NSMutableAttributedString alloc]initWithString:result attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor darkGrayColor],NSKernAttributeName:@2.0,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrokeColorAttributeName:[UIColor darkGrayColor]}];
    
    UIViewController *currentVC = [self getCurrentViewController];

    
    [UIAlertController showActionSheetInViewController:currentVC
                                             withTitle:@"Test Action Sheet"
                                mutableAttributedTitle:title
                                               message:@"Test Message"
                              mutableAttributedMessage:attributedMessage
                                     buttonTitlesArray:@[@"确 定", @"取 消"]
                                 buttonTitleColorArray:@[BA_Mian_Color, [UIColor darkGrayColor]]
#if TARGET_OS_IOS
                    popoverPresentationControllerBlock:^(UIPopoverPresentationController *popover){
                        popover.sourceView = currentVC.view;
                        popover.sourceRect = currentVC.view.frame;
                    }
#endif
                                              tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                  NSLog(@"你点击了第 %ld 个按钮！", (long)buttonIndex);
                                                  if (buttonIndex == 0) {
                                                      [self pushLoginController];
                                                  }
                                              }];
}

- (void)pushLoginController {
    [UIView transitionFromView:APPDelegate.window.rootViewController.view
                        toView:APPDelegate.navController.view
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCurlDown
                    completion:^(BOOL finished)
     {
         APPDelegate.tabBarControllerConfig.tabBarController.selectedIndex = 0;
         [APPDelegate.window setRootViewController:APPDelegate.navController];
     }];
    
}

@end
