/* !:
 * @FileName   :   BaseViewController.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <UIKit/UIKit.h>
@class HTViewModel;

@interface BaseViewController : UIViewController

/**
 *  viewModel
 */
@property (strong, nonatomic, readonly) HTViewModel *viewModel;
/**
 *  NavBar
 */
@property (strong, nonatomic) UINavigationBar *navBar;

- (instancetype)initWithViewModel:(HTViewModel *)viewModel;
- (void)bindViewModel;

@end
