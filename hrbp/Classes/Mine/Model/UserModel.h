/* !:
 * @FileName   :   UserModel.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/9.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <Foundation/Foundation.h>
#define USERSHARE [UserModel sharedUserModel]

@interface UserModel : NSObject

/*！电话号码 */
@property (nonatomic, copy  ) NSString  *phone;

/*！昵称 */
@property (nonatomic, copy  ) NSString  *nickName;

/*！密码 */
@property (nonatomic, copy  ) NSString  *pwd;

/*！所属企业 */
@property (nonatomic, copy  ) NSString  *department;

/*！用户识别码：唯一【登录后才有】 */
@property (nonatomic, copy  ) NSString  *userCode; //token

@property (nonatomic, assign) BOOL       isLogin;


+ (UserModel *)sharedUserModel;


@end
