/* !:
 * @FileName   :   itemCell.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/8.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "BindViewDelegate.h"

@interface itemCell : UICollectionViewCell<BindViewDelegate>
@property (strong, nonatomic)  UILabel     *nameLabel;
@property (strong, nonatomic)  UIImageView *itemImageview;

- (void)bindModel:(id)model;

@end
