
#import <Foundation/Foundation.h>
/**
 *  给NSDictionary类添加许多有用的方法
 */
@interface NSDictionary (BAKit)

/**
 *  字典转JSON
 */
- (NSString *)dictionaryToJson;

/**
 *  字典转JSON
 */
+ (NSString *)dictionaryToJson:(NSDictionary *)dictionary;


@end
