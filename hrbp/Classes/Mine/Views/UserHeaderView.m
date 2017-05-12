/* !:
 * @FileName   :   UserHeaderView.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/9.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "UserHeaderView.h"

@implementation UserHeaderView

#pragma mark - initview
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

#pragma mark - life cycle
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(@15);
        make.right.equalTo(@15);
        make.height.equalTo(@30);
        
    }];
    
    [self.department mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@15);
        make.top.equalTo(self.name.mas_bottom).offset(5);
        make.right.equalTo(@15);
        make.height.equalTo(@25);
        
    }];
}
- (void)setUserSignal:(RACSignal *)userSignal{
   
    _userSignal = userSignal;
//    @weakify(self);
//    [_userSignal subscribeNext:^(id x) {
//        
//        @strongify(self);
//
//    }];
}

- (void)setUserModel:(UserModel *)userModel{
    _userModel = userModel;
    if (_userModel) {
        
        self.name.text = _userModel.name;
        self.department.text = _userModel.position;
    }
}

#pragma mark - getter
- (UILabel *)name{
    return HT_LAZY(_name, ({
    
        UILabel *name = [[UILabel alloc] init];
        name.textAlignment = NSTextAlignmentLeft;
        name.font = BA_FontSize(21);
        [self addSubview:name];

        name;
    }));
}

- (UILabel *)department{
    
    return HT_LAZY(_department, ({
        
        UILabel *department = [[UILabel alloc] init];
        department.textAlignment = NSTextAlignmentLeft;
        department.font = BA_FontSize(14);
        [self addSubview:department];
        
        department;
    }));
}

@end
