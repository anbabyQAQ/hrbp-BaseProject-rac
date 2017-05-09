/* !:
 * @FileName   :   itemCell.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/8.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "itemCell.h"
#import "HTItemModel.h"

@implementation itemCell

- (void)layoutSubviews
{
    [super layoutSubviews];


    [self.itemImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-35);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.itemImageview.mas_bottom).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.right.equalTo(self.contentView.mas_right).offset(-5);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
    }];
    
}

- (void)bindModel:(HTItemModel *)model {
    self.nameLabel.text = model.name;
    self.itemImageview.image = BA_ImageName(model.cover_image);
}

- (UILabel *)nameLabel{
    return HT_LAZY(_nameLabel, ({
        
        UILabel *label = [UILabel new];
        label.font = HTSetFont(@"DamascusLight", 16);
        label.textColor = SetColor(80, 189, 203);
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        label;
    }));
}

- (UIImageView *)itemImageview{
    return HT_LAZY(_itemImageview, ({
        
        UIImageView *view = [UIImageView new];
        [self.contentView addSubview:view];
        view;
    }));
}


@end
