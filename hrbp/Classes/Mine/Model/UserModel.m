
/* !:
 * @FileName   :   UserModel.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/9.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "UserModel.h"

@implementation UserModel


/*！
 *  单例对象对外的唯一接口，用到dispatch_once在初始化时执行一次任务，且dispatch_once保证线程安全
 *
 */
+ (UserModel *)sharedUserModel
{
    /*! 为单例对象创建的静态实例，置为nil，因为对象的唯一性，必须是static类型 */
    static id sharedUserModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserModel = [[super allocWithZone:NULL] init];
    });
    return sharedUserModel;
}

/*！
 *  重写allocWithZone方法，保证alloc或者init创建的实例不会产生新实例，因为该类覆盖了allocWithZone方法，所以只能通过其父类分配内存，即[super allocWithZone]
 *
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedUserModel];
}

- (id)copy
{
    NSLog(@"这是一个单例对象，copy将不起任何作用");
    return self;
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedUserModel];
}



@end
