/* !:
 * @FileName   :   UserHeaderView.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/9.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface UserHeaderView : UIView

/** name */
@property (nonatomic, copy) UILabel *name;

/** department */
@property (nonatomic, copy) UILabel *department;

/** UserModel */
@property (nonatomic, copy) UserModel *userModel;

/**  user 信号 */
@property (strong, nonatomic) RACSignal *userSignal;
@end
