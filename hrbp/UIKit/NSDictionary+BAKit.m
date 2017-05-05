

#import "NSDictionary+BAKit.h"

@implementation NSDictionary (BAKit)
/* 字典转JSON */
- (NSString *)dictionaryToJson {
    return [NSDictionary dictionaryToJson:self];
}

/* 字典转JSON */
+ (NSString *)dictionaryToJson:(NSDictionary *)dictionary {
    NSString *json     = nil;
    NSError  *error    = nil;
    NSData   *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                         options:NSJSONWritingPrettyPrinted
                                                           error:&error];
    
    if (!jsonData) {
        return @"{}";
    } else if (!error) {
        json = [[NSString alloc] initWithData:jsonData
                                     encoding:NSUTF8StringEncoding];
        return json;
    } else {
        return error.localizedDescription;
    }
}

@end
