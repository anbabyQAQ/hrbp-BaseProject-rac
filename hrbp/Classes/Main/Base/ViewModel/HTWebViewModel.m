/* !:
 * @FileName   :   HTWebViewModel.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HTWebViewModel.h"

@interface HTWebViewModel ()

@end

@implementation HTWebViewModel

- (instancetype)initWithServices:(id<HTViewModelService>)services params:(NSDictionary *)params
{
    if (self = [super initWithServices:services params:params]) {
        
        _requestURL = params[RequestURLkey];
        _webType = [params[WebViewTypekey] unsignedIntegerValue];
    }
    return self;
}

@end
