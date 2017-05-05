
#import <Foundation/Foundation.h>

/*!
 *  给NSMutableArray类添加许多有用的方法
 */
@interface NSMutableArray (BAKit)

/*!
 *  获取在安全模式下给定索引的对象（如果自身是空的则无）
 */
- (id)safeObjectAtIndex:(NSUInteger)index; // 设定的索引

/*!
 *  移动对象从一个索引到另一个索引
 */
- (void)moveObjectFromIndex:(NSUInteger)from // 源索引
                    toIndex:(NSUInteger)to; // 目标索引

/*!
 *  创建反向数组
 */
- (NSMutableArray *)reversedArray;

/*!
 *  获取给定的键值和排序的数组
 */
+ (NSMutableArray *)sortArrayByKey:(NSString *)key // 键值
                             array:(NSMutableArray *)array // 指定的集合
                         ascending:(BOOL)ascending; // YES为升序，NO为降序

/*!
 *  将字符串中的文字和表情解析出来
 *
 *  @param string 带表情的字符串
 *
 *  @return NSMutableArray
 */
+ (NSMutableArray *)ba_decorateString:(NSString *)string;

@end
