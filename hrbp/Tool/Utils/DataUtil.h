//
//  DataUtil.h
//  mts-iphone
//
//  Created by Doulala on 12-9-20.
//  Copyright (c) 2012年 中国电信. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataUtil : NSObject

+ (BOOL)isEmptyString:(NSString*)str;//

+ (NSString*) newGUIDString;//

+ (NSString *)URLEncodedString:(NSString*) str;

+ (NSNumber *)numberForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary;

+ (NSString *)stringForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary;

+ (NSDate *)dateForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary;
+ (NSDate *)newDateForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary;
+(BOOL)newBoolForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary;


+ (NSArray *)arrayForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary;

+ (NSDictionary *)dictionaryForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary;

+ (NSData*) dataOfFile:(NSString*) path;

@end
