

#import <UIKit/UIKit.h>

#if TARGET_OS_IOS
typedef void (^UIAlertControllerPopoverPresentationControllerBlock) (UIPopoverPresentationController * __nonnull popover);
#endif
typedef void (^UIAlertControllerCompletionBlock) (UIAlertController * __nonnull controller, UIAlertAction * __nonnull action, NSInteger buttonIndex);

@interface UIAlertController (Blocks)

@property (readonly, nonatomic) BOOL visible;
//@property (readonly, nonatomic) NSInteger firstOtherButtonIndex;


+ (nonnull instancetype)showInViewController:(nonnull UIViewController *)viewController
                                   withTitle:(nullable NSString *)title
                      mutableAttributedTitle:(nullable NSMutableAttributedString *)mutableAttributedTitle
                                     message:(nullable NSString *)message
                    mutableAttributedMessage:(nullable NSMutableAttributedString *)mutableAttributedMessage
                              preferredStyle:(UIAlertControllerStyle)preferredStyle
                           buttonTitlesArray:(nullable NSArray *)buttonTitlesArray
                       buttonTitleColorArray:(nullable NSArray <UIColor *>*)buttonTitleColorArray
#if TARGET_OS_IOS
          popoverPresentationControllerBlock:(nullable UIAlertControllerPopoverPresentationControllerBlock)popoverPresentationControllerBlock
#endif
                                    tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;

+ (nonnull instancetype)showAlertInViewController:(nonnull UIViewController *)viewController
                                        withTitle:(nullable NSString *)title
                           mutableAttributedTitle:(nullable NSMutableAttributedString *)mutableAttributedTitle
                                          message:(nullable NSString *)message
                         mutableAttributedMessage:(nullable NSMutableAttributedString *)mutableAttributedMessage
                                buttonTitlesArray:(nullable NSArray *)buttonTitlesArray
                            buttonTitleColorArray:(nullable NSArray <UIColor *>*)buttonTitleColorArray
                                         tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;


+ (nonnull instancetype)showActionSheetInViewController:(nonnull UIViewController *)viewController
                                              withTitle:(nullable NSString *)title
                                 mutableAttributedTitle:(nullable NSMutableAttributedString *)mutableAttributedTitle
                                                message:(nullable NSString *)message
                               mutableAttributedMessage:(nullable NSMutableAttributedString *)mutableAttributedMessage
                                      buttonTitlesArray:(nullable NSArray *)buttonTitlesArray
                                  buttonTitleColorArray:(nullable NSArray <UIColor *>*)buttonTitleColorArray
#if TARGET_OS_IOS
                     popoverPresentationControllerBlock:(nullable UIAlertControllerPopoverPresentationControllerBlock)popoverPresentationControllerBlock
#endif
                                               tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;




@end
