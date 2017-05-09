//
//  HTMediatorAction+BaseWebViewController.m
//  hrbp
//
//  Created by tyl on 2017/5/8.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import "HTMediatorAction+BaseWebViewController.h"

@implementation HTMediatorAction (BaseWebViewController)


- (void)pushWebViewControllerWithViewModel:(HTWebViewModel *)viewModel
{
    id vc = [@"BaseWebViewController" VKCallClassAllocInitSelectorName:@"initWithViewModel:" error:nil,viewModel];
    UIViewController *currentVC = [self performTarget:nil action:nil];
    
    if ([vc isKindOfClass:[UIViewController class]]) {
        [currentVC.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
