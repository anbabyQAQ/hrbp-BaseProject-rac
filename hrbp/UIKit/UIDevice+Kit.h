//
//  UIDevice+Kit.h
//  BaseProject
//
//  Created by tyl on 2017/4/24.
//  Copyright © 2017年 tyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Kit)

/**
 *  获取iOS版本
 */
#define IOS_VERSION [UIDevice currentDevice].systemVersion

//#define isiOS10 ([[[[[UIDevice currentDevice] systemVersion] substringToIndex:1] stringByAppendingString:@"0"] intValue] == 10)

#define isiOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

/*! 大于8.0 */
#define IOS8x ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

//#define isiOS10 ([[[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

/*! 判断真机还是模拟器 */
#if TARGET_IPHONE_SIMULATOR
//NSLog(@"run on simulator");
#define BA_SIMULATOR_TEST
#else
//不定义SIMULATOR_TEST这个宏
//NSLog(@"run on device");
#endif


/**
 *  获取屏幕宽度和高度
 */
#define BA_SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define BA_SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define BA_NAVIGATION_HEIGHT 64

/**
 *  系统版本号对比
 *  @param v Version, like @"8.0"
 */
// 系统版本等于
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
// 系统版本大于
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
// 系统版本大于等于
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
// 系统版本小于
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
// 系统版本小于等于
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

/*! 判断当前的iPhone设备 */
// 判断是否为iPhone
//#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])

// 判断是否为iPad
//#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPAD ([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])

//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

// 判断是否为 iPhone 5S / SE
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f

// 判断是否为iPhone 6/6s
#define iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f

// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f



/**
 *  返回平台设备
 */
+ (NSString *)devicePlatform;

/**
 *  返回平台设备字符串
 */
+ (NSString *)devicePlatformString;

/**
 *  检查是否是IPAD
 */
+ (BOOL)isiPad;

/**
 *  检查是否是iPhone
 */
+ (BOOL)isiPhone;

/**
 *  检查是否是iPod
 */
+ (BOOL)isiPod;

/**
 *  检查是否是simulator
 */
+ (BOOL)isSimulator;

/**
 *  检查是否是a Retina display
 */
+ (BOOL)isRetina;

/**
 *  检查是否是a Retina HD display
 */
+ (BOOL)isRetinaHD;

/**
 *  返回IOS版本号
 */
+ (NSInteger)iOSVersion;

/**
 *  返回CPU频率
 */
+ (NSUInteger)cpuFrequency;

/**
 *  返回总线频率
 */
+ (NSUInteger)busFrequency;

/**
 *  返回物理内存大小
 */
+ (NSUInteger)ramSize;

/**
 *  返回CPU数
 */
+ (NSUInteger)cpuNumber;

/**
 *  返回总内存
 */
+ (NSUInteger)totalMemory;

/**
 *  返回非内核内存
 */
+ (NSUInteger)userMemory;

/**
 *  返回文件系统空间
 */
+ (NSNumber *)totalDiskSpace;

/**
 *  返回文件系统剩余空间
 */
+ (NSNumber *)freeDiskSpace;

/**
 *  返回当前设备的mac地址
 */
+ (NSString *)macAddress;

/**
 *  返回唯一标识符
 */
+ (NSString *)uniqueIdentifier;

/*! 调用私有方法实现强制屏幕旋转 */
+ (void)changeOrientation:(UIInterfaceOrientation)orientation;


@end
