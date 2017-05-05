/* !:
 * @FileName   :   HTReactiveView.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */


#import <Foundation/Foundation.h>

@protocol HTReactiveView <NSObject>

/**
 绑定一个viewmodel给view

 @param viewModel Viewmodel
 */
- (void)bindViewModel:(id)viewModel withParams:(NSDictionary *)params;

@end
