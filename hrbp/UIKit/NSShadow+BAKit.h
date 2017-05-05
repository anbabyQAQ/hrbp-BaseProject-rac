

#import <UIKit/UIKit.h>

@interface NSShadow (BAKit)

/*!
 *  设置阴影
 *
 *  @param shadowColor      阴影颜色
 *  @param shadowSize       阴影范围
 *  @param shadowBlurRadius 阴影模糊度
 *
 *  @return 阴影效果
 */
- (void)ba_shadowWithColor:(UIColor *)shadowColor
                    shadowOffset:(CGSize)shadowSize
                shadowBlurRadius:(CGFloat)shadowBlurRadius;

@end
