

#import <Foundation/Foundation.h>

@interface NSData (BAKit)

/**
 *   Returns a lowercase NSString for md5 hash.
 *
 *  @return  Returns a lowercase NSString for md5 hash.
 */
- (NSString *)md5String;

/**
 *   Returns an NSData for md5 hash.
 *
 *  @return  Returns an NSData for md5 hash.
 */
- (NSData *)md5Data;

/**
 *   Returns an NSData for hmac using algorithm md5 with key.
 *
 *  @param key The hmac key.
 *
 *  @return  Returns an NSData for hmac using algorithm md5 with key.
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key;


@end
