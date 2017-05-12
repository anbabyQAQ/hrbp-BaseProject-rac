/* !:
 * @FileName   :   UserModel.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/9.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <Foundation/Foundation.h>
#define USERSHARE [UserModel sharedUserModel]

/*
"data": [
         {
         name:张三,
         userAccountNum:18500000000,
         province:江苏省,
         city:连云港市,
         district:,
         street:,
         grid:,
         position:总经理,	
         }
         ]
*/

@interface UserModel : NSObject

/*！电话号码 */
@property (nonatomic, copy  ) NSString  *userAccountNum;

/*！昵称 */
@property (nonatomic, copy  ) NSString  *name;

/*！所属省 */
@property (nonatomic, copy  ) NSString  *province;

/*！所属市 */
@property (nonatomic, copy  ) NSString  *city;

/*！行政区 */
@property (nonatomic, copy  ) NSString  *district;

/*！街道 */
@property (nonatomic, copy  ) NSString  *street;

/*！grid */
@property (nonatomic, copy  ) NSString  *grid;

/*！职位 */
@property (nonatomic, copy  ) NSString  *position;

/*！用户识别码：唯一【登录后才有】 */
@property (nonatomic, copy  ) NSString  *authToken; //token

/*！用户识别码：唯一 刷新token标识符 */
@property (nonatomic, copy  ) NSString  *refreshToken; //token

@property (nonatomic, assign) BOOL       isLogin;


+ (UserModel *)sharedUserModel;


@end
