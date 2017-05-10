/* !:
 * @FileName   :   HRMineViewModel.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HRMineViewModel.h"
#import "HRMineAboutViewController.h"
#import "HRAboutUsViewModel.h"
#import "HRVersionAboutViewModel.h"
#import "HTViewModelServicesImpl.h"
#import "HTMediatorAction+HRMineAboutViewController.h"

@implementation HRMineViewModel

- (instancetype)initWithServices:(id<HTViewModelService>)services params:(NSDictionary *)params{
    
    if (self = [super initWithServices:services params:params]) {
        _userData = [NSArray new];
    }
    return self;
}
- (void)initialize{
    
    [super initialize];
    
    _detailCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        NSLog(@"%@",input);
//        switch (input.row) {
//            case 0:{
//                HTViewModelServicesImpl *servicesImpl = [[HTViewModelServicesImpl alloc] initModelServiceImpl];
//                HRAboutUsViewModel *viewModel = [[HRAboutUsViewModel alloc] initWithServices:servicesImpl params:nil];
//                [[HTMediatorAction sharedInstance] pushAboutUsControllerWithViewModel:viewModel];
//            }
//            case 1:{
//                HTViewModelServicesImpl *servicesImpl = [[HTViewModelServicesImpl alloc] initModelServiceImpl];
//                HRAboutUsViewModel *viewModel = [[HRAboutUsViewModel alloc] initWithServices:servicesImpl params:nil];
//                [[HTMediatorAction sharedInstance] pushAboutUsControllerWithViewModel:viewModel];
//            }
        
//                break;
//                
//            default:
//                break;
//        }
        
        return [RACSignal empty];
        
    }];
    
    _logoutCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        
        return [RACSignal empty];

    }];
    
}

- (RACSignal *)executeRequestDataSignal:(id)input
{

    return [[[self.services getMineService] requestMineDataSignal:nil] doNext:^(id  _Nullable result) {
        
        self.userData = result;
        
    }];
 
}




@end
