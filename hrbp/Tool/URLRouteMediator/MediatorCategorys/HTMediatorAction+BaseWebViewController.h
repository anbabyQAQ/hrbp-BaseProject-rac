//
//  HTMediatorAction+BaseWebViewController.h
//  hrbp
//
//  Created by tyl on 2017/5/8.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import "HTMediatorAction.h"

@class HTWebViewModel;


@interface HTMediatorAction (BaseWebViewController)

- (void)pushWebViewControllerWithViewModel:(HTWebViewModel *)viewModel;

@end
