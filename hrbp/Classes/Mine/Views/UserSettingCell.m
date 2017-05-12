/* !:
 * @FileName   :   UserSettingCell.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/8.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "UserSettingCell.h"
#import "HRMineViewModel.h"

@interface UserSettingCell ()

/**
 *  图片
 */
@property (strong, nonatomic) UIImageView *avatarView;
/**
 *  title
 */
@property (strong, nonatomic) UILabel *avatarLabel;

@end

@implementation UserSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    
    [self.avatarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-100);
        make.height.equalTo(@40);
    }];
    
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top).offset(2);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.avatarLabel.mas_right).offset(5);
        make.height.equalTo(@25);
    }];


}

- (void)bindViewModel:(id)viewModel withParams:(NSDictionary *)params
{
    HRMineViewModel *mineViewModel = viewModel;
    NSDictionary *dic = mineViewModel.userData[[params[DataIndex] integerValue]];
    self.avatarLabel.text = dic[@"userConfiguration"];
}

- (UIImageView *)avatarView
{
    return HT_LAZY(_avatarView, ({
        
        UIImageView *view = [UIImageView new];
        [self.contentView addSubview:view];
        view;
    }));
}
- (UILabel *)avatarLabel
{
    return HT_LAZY(_avatarLabel, ({
        
        UILabel *label = [UILabel new];
        label.font = HTSetFont(@"DamascusLight", 20);
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        label;
    }));
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
