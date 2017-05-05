//
//  NSObject+NSObject_MJParse.h
//  BaseProject
//
//  Created by tyl on 2017/4/25.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface NSObject (NSObject_MJParse)

/*
 MJExtension 解析数组和字典需要使用不同的方法.
 我们自己合并,用代码判断
 */

+ (id)BAMJParse:(id)responseObj;
@end
