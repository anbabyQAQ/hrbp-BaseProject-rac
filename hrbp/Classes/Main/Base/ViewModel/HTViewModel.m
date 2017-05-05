/* !:
 * @FileName   :   HTViewModel.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HTViewModel.h"

@interface HTViewModel ()

@property (strong, nonatomic, readwrite) id<HTViewModelService> services;
@property (strong, nonatomic, readwrite) RACCommand *requestDataCommand;
@property (assign, nonatomic, readwrite) HTNavBarStyleType navBarStyleType;
@property (copy, nonatomic, readwrite) NSString *title;

@end

@implementation HTViewModel
- (instancetype)initWithServices:(id<HTViewModelService>)services params:(NSDictionary *)params
{
    
    if ([super init]) {

        self.services = services;
        self.navBarStyleType = [params[NavBarStyleTypekey] integerValue];
        self.title = params[ViewTitlekey];
        @weakify(self);
        self.requestDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [[self executeRequestDataSignal:input] takeUntil:self.rac_willDeallocSignal];
        }];
        
        [self initialize];
    }
    return self;
}

- (void)initialize{}

- (RACSignal *)executeRequestDataSignal:(id)input
{
    return [RACSignal empty];
}
@end
