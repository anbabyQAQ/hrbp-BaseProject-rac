

#import <Foundation/Foundation.h>

@interface NSDateFormatter (BAKit)

+ (id)ba_dateFormatter;

+ (id)ba_dateFormatterWithFormat:(NSString *)dateFormat;

+ (id)ba_defaultDateFormatter;/*yyyy-MM-dd HH:mm:ss*/


@end
