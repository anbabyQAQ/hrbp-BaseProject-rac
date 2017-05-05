//
//  NSObject+NSObject_MJParse.m
//  BaseProject
//
//  Created by tyl on 2017/4/25.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import "NSObject+NSObject_MJParse.h"

@implementation NSObject (NSObject_MJParse)

/** MJExtension是从属性名 -> key */
/*
 如果 key 就是 desc, 那么下方代码自动切换为description则出错
 */

/*
 + (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
 {
 if ([propertyName isEqualToString:@"ID"])
 {
 propertyName = @"id";
 }
 if ([propertyName isEqualToString:@"desc"])
 {
 propertyName = @"description";
 }
 // ...
 return propertyName;
 }
 */

+ (id)BAMJParse:(id)responseObj
{
    if ([responseObj isKindOfClass:[NSArray class]])
    {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]])
    {
        return [self mj_objectWithKeyValues:responseObj];
    }
    
    return responseObj;
}


@end
