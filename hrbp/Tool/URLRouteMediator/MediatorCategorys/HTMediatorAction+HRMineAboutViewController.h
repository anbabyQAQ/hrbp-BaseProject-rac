//
//  HTMediatorAction+HRMineAboutViewController.h
//  hrbp
//
//  Created by tyl on 2017/5/8.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import "HTMediatorAction.h"

@class HRAboutUsViewModel;

@interface HTMediatorAction (HRMineAboutViewController)

- (void)pushAboutUsControllerWithViewModel:(HRAboutUsViewModel *)viewModel;


@end
