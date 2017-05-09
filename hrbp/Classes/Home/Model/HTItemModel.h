/* !:
 * @FileName   :   HTItemModel.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/8.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface HTItemModel : NSObject

/**
 *  item图片
 */
@property (copy, nonatomic) NSString *cover_image;
/**
 *  item标题
 */
@property (copy, nonatomic) NSString *name;

/**
 *  item url
 */
@property (copy, nonatomic) NSString *url;

@end
