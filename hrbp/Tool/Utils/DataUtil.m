//
//  DataUtil.m
//  mts-iphone
//
//  Created by Doulala on 12-9-20.
//  Copyright (c) 2012年 中国电信. All rights reserved.
//

#import "DataUtil.h"

@implementation DataUtil
+(BOOL)isEmptyString:(NSString*)str{
    return !str||[@"" isEqual:str];
}
+(NSString*)newGUIDString
{
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    NSString* uuidString = (NSString*)CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
    uuidString=[uuidString stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return uuidString;
}

+ (NSString *)URLEncodedString:(NSString*) str{
    CFStringRef encoded= CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                 (CFStringRef)str,
                                                                 (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                                 NULL,
                                                                 kCFStringEncodingUTF8);
    NSString *encodedString=[NSString stringWithFormat:@"%@",encoded];
    
    
    NSArray *escapeChars = [NSArray arrayWithObjects:@";" , @"/" , @"?" , @":" ,
                            @"@" , @"&" , @"=" , @"+" ,
                            @"$" , @"," , @"[" , @"]",
                            @"#", @"!", @"'", @"(",
                            @")", @"*", @" ", nil];
    
    NSArray *replaceChars = [NSArray arrayWithObjects:@"%3B" , @"%2F" , @"%3F" ,
                             @"%3A" , @"%40" , @"%26" ,
                             @"%3D" , @"%2B" , @"%24" ,
                             @"%2C" , @"%5B" , @"%5D",
                             @"%23", @"%21", @"%27",
                             @"%28", @"%29", @"%2A", @"+", nil];
    
    
    int len = [escapeChars count];
    
    NSMutableString *temp = [str mutableCopy];
    
    int i;
    for(i = 0; i < len; i++)
    {
        
        [temp replaceOccurrencesOfString:[escapeChars objectAtIndex:i]
                              withString:[replaceChars objectAtIndex:i]
                                 options:NSLiteralSearch
                                   range:NSMakeRange(0, [temp length])];
    }
    
    NSString *result = [NSString stringWithString: temp];
    return result;
    
    
    


}

+(NSNumber *)numberForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary{
    NSNumber * number=[dictionary objectForKey:key];
    if (![number isEqual:[NSNull null]]) {
        return number;
    }else{
        return nil;
    }
}
+(NSString *)stringForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary{
    NSString * string=[dictionary objectForKey:key];
    if (![string isEqual:[NSNull null]]) {
        return string;
    }else{
        //        return nil;
        return @"";
    }
}
+(NSDate *)dateForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary{
    NSDate * date=[dictionary objectForKey:key];
    if (![date isEqual:[NSNull null]]) {
        return date;
    }else{
        return nil;
    }
}
+ (NSDate *)newDateForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary{
    NSNumber * value=[dictionary objectForKey:key];
    if (![value isEqual:[NSNull null]]) {
        NSDate * date=[NSDate dateWithTimeIntervalSince1970:[value doubleValue]/1000];
        return date;
    }else{
        return nil;
    }
}
+(BOOL)newBoolForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary{
    NSNumber * value=[dictionary objectForKey:key];
    if (![value isEqual:[NSNull null]]) {
        if ([value integerValue]==0 || value==nil) {
            return FALSE;
        }else{
            return TRUE;
        }
    }else{
        return nil;
    }
}

+(NSArray *)arrayForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary{
    NSArray * array=[dictionary objectForKey:key];
    if (![array isEqual:[NSNull null]]) {
        return array;
    }else{
        return nil;
    }
}
+(NSDictionary *)dictionaryForKey:(NSString *)key inDictionary:(NSDictionary *)dictionary{
    NSDictionary * dicc=[dictionary objectForKey:key];
    if (![dicc isEqual:[NSNull null]]) {
        return dicc;
    }else{
        return nil;
    }
}


+(NSData*) dataOfFile:(NSString*) path
{
    NSFileManager * fm = [NSFileManager defaultManager];
    return [fm contentsAtPath:path];
}
@end
