/* !:
 * @FileName   :   HRAboutUsViewModel.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/8.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HRAboutUsViewModel.h"

@implementation HRAboutUsViewModel

- (instancetype)initWithServices:(id<HTViewModelService>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        _aboutUs = nil;
    }
    return self;
}

- (void)initialize{
    
    [super initialize];

}

- (RACSignal *)executeRequestDataSignal:(id)input
{
    return [[[self.services getMineService] requestMineAboutUsDataSignal:CityTravel_URL] doNext:^(id  _Nullable result) {
        
        self.aboutUs = result;
        
    }];
}
@end
