

#import "NSShadow+BAKit.h"

@implementation NSShadow (BAKit)

- (void)ba_shadowWithColor:(UIColor *)shadowColor
              shadowOffset:(CGSize)shadowSize
          shadowBlurRadius:(CGFloat)shadowBlurRadius
{
    self.shadowColor = shadowColor;
    self.shadowOffset = shadowSize;
    self.shadowBlurRadius = shadowBlurRadius;
}

@end
