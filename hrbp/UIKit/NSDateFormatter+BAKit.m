

#import "NSDateFormatter+BAKit.h"

@implementation NSDateFormatter (BAKit)

+ (id)ba_dateFormatter
{
    return [[self alloc] init];
}

+ (id)ba_dateFormatterWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (id)ba_defaultDateFormatter
{
    return [self ba_dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

@end
