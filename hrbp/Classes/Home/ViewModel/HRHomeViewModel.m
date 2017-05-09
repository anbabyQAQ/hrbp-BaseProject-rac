/* !:
 * @FileName   :   HRHomeViewModel.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HRHomeViewModel.h"
#import "HTViewModelServicesImpl.h"
#import "HTItemModel.h"
#import "HTWebViewModel.h"
#import "HTMediatorAction+BaseWebViewController.h"


@implementation HRHomeViewModel

- (instancetype)initWithServices:(id<HTViewModelService>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        _travelData = [NSArray new];
        _bannerData = [NSArray new];
    }
    return self;
}

- (void)initialize{
    [super initialize];
    
    _detailCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"select : %@", input);

        HTItemModel *model = input;
        NSString *requestURL = model.url;
        
//        HTViewModelServicesImpl *servicesImpl = [[HTViewModelServicesImpl alloc] initModelServiceImpl];

        HTWebViewModel *viewModel = [[HTWebViewModel alloc] initWithServices:self.services params:@{RequestURLkey:requestURL,NavBarStyleTypekey:@(kNavBarStyleNomal)}];
        
        [[HTMediatorAction sharedInstance] pushWebViewControllerWithViewModel:viewModel];
        
        return [RACSignal empty];
    }];

}

- (RACSignal *)executeRequestDataSignal:(id)input
{
//    if ([input integerValue] == RealStatusNotReachable) {
//        
//        self.netWorkStatus = RealStatusNotReachable;
//        return [RACSignal empty];
//        
//    }else{
    
        return [[[self.services getHomeService] requestHomeDataSignal:nil] doNext:^(id  _Nullable result) {
            
            self.bannerData = result[BannerDatakey];
            self.travelData = result[BusinessActionDatakey];
            
        }];
//    }
}

@end
