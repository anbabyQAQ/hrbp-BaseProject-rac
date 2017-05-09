//
//  HTMediatorAction+HRMineAboutViewController.m
//  hrbp
//
//  Created by tyl on 2017/5/8.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import "HTMediatorAction+HRMineAboutViewController.h"
#import "HRAboutUsViewModel.h"

@implementation HTMediatorAction (HRMineAboutViewController)


- (void)pushAboutUsControllerWithViewModel:(HRAboutUsViewModel *)viewModel{
    id vc = [@"HRMineAboutViewController" VKCallClassAllocInitSelectorName:@"initWithViewModel:" error:nil,viewModel];
    UIViewController *currentVC = [self performTarget:nil action:nil];
    
    if ([vc isKindOfClass:[UIViewController class]]) {
        [currentVC.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
