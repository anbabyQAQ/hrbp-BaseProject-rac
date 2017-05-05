

#import "NSData+BAKit.h"
#include <CommonCrypto/CommonCrypto.h>
#include <zlib.h>

@implementation NSData (BAKit)

- (NSString *)md5String
{
    /*
     NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
     
     unsigned char hash[CC_MD5_DIGEST_LENGTH];
     
     CC_MD5([data bytes], (CC_LONG)[data length], hash);
     
     NSMutableString *md5String = [NSMutableString string];
     
     for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
     {
     [md5String appendFormat:@"%02x",hash[i]];
     }
     return [md5String copy];
     */
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSData *)md5Data
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)hmacMD5StringWithKey:(NSString *)key
{
    return [self hmacStringUsingAlg:kCCHmacAlgMD5 withKey:key];
}

- (NSString *)hmacStringUsingAlg:(CCHmacAlgorithm)alg withKey:(NSString *)key {
    size_t size;
    switch (alg) {
        case kCCHmacAlgMD5: size = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: size = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: size = CC_SHA512_DIGEST_LENGTH; break;
        default: return nil;
    }
    unsigned char result[size];
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(alg, cKey, strlen(cKey), self.bytes, self.length, result);
    NSMutableString *hash = [NSMutableString stringWithCapacity:size * 2];
    for (int i = 0; i < size; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

@end
