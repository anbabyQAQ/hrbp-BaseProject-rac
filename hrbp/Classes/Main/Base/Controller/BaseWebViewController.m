/* !:
 * @FileName   :   BaseWebViewController.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "BaseWebViewController.h"
#import "FTDIntegrationWebView.h"
#import "HTWebViewModel.h"
#import "UIViewController+HTHideBottomLine.h"

typedef enum
{
    WKScriptMessage_UserInfoType    = 1001, //用户权限信息
    WKScriptMessage_ShowBtnType     = 2001, //显示“对比”按钮
    WKScriptMessage_HideBtnType     = 2002, //隐藏“对比”按钮
    WKScriptMessage_NetworkingType  = 3001  //常规网络请求
}WKScriptMessage_Type;


@interface BaseWebViewController ()<FTDIntegrationWebViewDelegate>
/**
 *  viewModel
 */
@property (strong, nonatomic, readonly) HTWebViewModel *viewModel;
/**
 *  webview
 */
@property (strong, nonatomic) FTDIntegrationWebView *webView;

/**
 *  leftButton
 */
@property (strong, nonatomic) UIButton *leftButton;

/**
 *  rightButton
 */
@property (strong, nonatomic) UIButton *rightButton;

/**
 *  是否点击返回按键
 */
@property (assign, nonatomic) NSInteger backListCount;


/**
 * WKScriptMessageType
 */
@property (assign, nonatomic) WKScriptMessage_Type type;
/**
 * WKScriptMessageCallBackJSFuntion
 */
@property (strong, nonatomic) NSString * JSFuntion;
/**
 * WKScriptMessageURL
 */
@property (strong, nonatomic) NSString * JSUrl;
/**
 * WKScriptMessageParams
 */
@property (strong, nonatomic) NSString * params;

@end

@implementation BaseWebViewController
@dynamic viewModel;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNavigationLeftBar];
}
- (void)setNavigationLeftBar
{
    // 导航栏navigationItem
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [[self.leftButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(UIButton * x) {
         NSLog(@"button clicked");
         [self backBtnAction:x];
     }];
    
}
- (void)setNavigationRightBar
{
    // 导航栏navigationItem
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [[self.rightButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(UIButton * x) {
         NSLog(@"button clicked");
         NSString *js = [NSString stringWithFormat:@"%@()",self.JSFuntion];
         [self.webView FTD_stringByEvaluatingJavaScriptFromString:js];
     }];
}

-(void)hideNavigationRightBar{
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)bindViewModel
{
    [super bindViewModel];
   
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
//    [self.webView loadURLString:self.viewModel.requestURL];
    
    @weakify(self);
    
    RAC(self.viewModel,JSUrl) = RACObserve(self, JSUrl);
    RAC(self.viewModel,params) = RACObserve(self, params);
    
    // 开始加载
    [[self
      rac_signalForSelector:@selector(FTD_WebViewDidStartLoad:)
      fromProtocol:@protocol(FTDIntegrationWebViewDelegate)]
    	subscribeNext:^(RACTuple *tuple) {
            @strongify(self)
            if (tuple.first == self.webView){
                if (self.webView.wkWebView.backForwardList.backList.count>=_backListCount) {
                    dispatch_main_async_safe(^{
                        [HTShowMessageView showStatusWithMessage:@"Loading..."];
                    });
                }
            }
        }];
    // 加载完成
    [[self
      rac_signalForSelector:@selector(FTD_WebView:didFinishLoadingURL:)
      fromProtocol:@protocol(FTDIntegrationWebViewDelegate)]
    	subscribeNext:^(RACTuple *tuple) {
            @strongify(self)
            if (tuple.first == self.webView){
                if (tuple.first) {
                    if (self.webView.wkWebView.backForwardList.backList.count>=_backListCount) {
                        dispatch_main_async_safe(^{
                            [HTShowMessageView dismissSuccessView:@"Success"];
                            if (self.viewModel.webType == kWebHomeFullviewDetailType) {
                                
                                NSString *jsMethod = @"document.getElementById(\"download\").remove();document.querySelector(\"header.has-banner\").style.marginTop = 0;";
                                [self.webView FTD_stringByEvaluatingJavaScriptFromString:jsMethod];
                            }
                            _backListCount = self.webView.wkWebView.backForwardList.backList.count;
                        });
                    }
                }
            }
        }];
    // 加载失败
    [[self
      rac_signalForSelector:@selector(FTD_WebView:didFailToLoadURL:error:)
      fromProtocol:@protocol(FTDIntegrationWebViewDelegate)]
    	subscribeNext:^(RACTuple *tuple) {
            @strongify(self)
            if (tuple.first == self.webView){
                
                dispatch_main_async_safe(^{
                    [HTShowMessageView dismissErrorView:@"Error"];
                });
            }
        }];
    
    // 标题
    if ([self.viewModel.title isNotBlank]) {
        RAC(self.navigationItem,title) = RACObserve(self.viewModel, title);
    }else{
        [[self
          rac_signalForSelector:@selector(FTD_WebView:title:)
          fromProtocol:@protocol(FTDIntegrationWebViewDelegate)]
         subscribeNext:^(RACTuple *tuple) {
             @strongify(self)
             
             dispatch_main_async_safe(^{
                 self.navigationItem.title = tuple.second;
             });
             
         }];
    }
    
    // OC-JS回调
    [[self
      rac_signalForSelector:@selector(FTD_WebView:userContentController:didReceiveScriptMessage:)
      fromProtocol:@protocol(FTDIntegrationWebViewDelegate)]
    	subscribeNext:^(RACTuple *tuple) {
            @strongify(self)
            if (tuple.first == self.webView){
                if (self.viewModel.webType == kWebHomeFullviewDetailType ||
                    self.viewModel.webType == kWebHomePersonnelFlowDetailType ||
                    self.viewModel.webType == kWebHomePersonnelWorkingEfficiencyDetailType ||
                    self.viewModel.webType == kWebHomePersonnelStandardDetailType) {
                    
                    WKScriptMessage *message = tuple.third;
                    [self javaScriptManagerFromMessage:message];
                }
            }
        }];
    
    self.webView.delegate = self;
    
    
    [self.viewModel.requestCommand.executionSignals.switchToLatest subscribeNext:^(NSString *value) {
        @strongify(self)
        if (value) {
            NSString *js = [NSString stringWithFormat:@"%@()",self.JSFuntion];
            [self.webView FTD_stringByEvaluatingJavaScriptFromString:js];
        }
    }];
    
    [self.viewModel.userInfoCommand.executionSignals.switchToLatest subscribeNext:^(NSString *value) {
        @strongify(self)
        if (value) {
            NSString *js = [NSString stringWithFormat:@"%@()",self.JSFuntion];
            [self.webView FTD_stringByEvaluatingJavaScriptFromString:js];
        }
    }];
    
}

- (void)javaScriptManagerFromMessage:(WKScriptMessage *)message{
    
    if ([message.name isEqualToString:getDataFromNative]) {
        NSLog(@"WKScriptMessage : %@",message.body[callback]);
        NSLog(@"WKScriptMessage : %@",message.body[params]);
        NSLog(@"WKScriptMessage : %@",message.body[url]);
        NSLog(@"WKScriptMessage : %@",message.body[type]);
        
        self.JSFuntion = message.body[callback];
        self.type      = [message.body[type] intValue];
        switch (_type) {
            case WKScriptMessage_UserInfoType:{
                [self.viewModel.userInfoCommand execute:@1];
            }
                break;
            case WKScriptMessage_ShowBtnType:{
                [self setNavigationRightBar];
            }
                break;
            case WKScriptMessage_HideBtnType:{
                [self hideNavigationRightBar];
            }
                break;
            case WKScriptMessage_NetworkingType:{
                self.JSUrl     = message.body[url];
                self.params    = [message.body[params] jsonStringEncoded];
                [self.viewModel.requestCommand execute:@1];
            }
                break;
                
            default:
                break;
        }
    }
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(self.view);
    }];
}
- (void)updateViewConstraints
{
    [self.webView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        if (self.viewModel.navBarStyleType == kNavBarStyleHidden) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.view).offset(-64);
        }
    }];
    
    [super updateViewConstraints];
}
#pragma mark - ***** 按钮点击事件
#pragma mark 返回按钮点击
- (void)backBtnAction:(UIButton *)sender
{
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

#pragma mark - getter
- (FTDIntegrationWebView *)webView
{
    return HT_LAZY(_webView, ({
        
        NSArray *message = @[getDataFromNative];
        
        FTDIntegrationWebView *view = [[FTDIntegrationWebView alloc]initWithFrame:self.view.bounds WithConfiguration:message];
        [self.view addSubview:view];
        view;
    }));
}
- (UIButton *)leftButton
{
    return HT_LAZY(_leftButton, ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 40, 40);
        [button setImage:[UIImage imageNamed:@"icon_nav_back_white_19x18_"] forState:UIControlStateNormal];
        button.adjustsImageWhenHighlighted = NO;
        button;
        
    }));
}
- (UIButton *)rightButton
{
    return HT_LAZY(_rightButton, ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 40, 40);
        [button setTitle:@"对比" forState:(UIControlStateNormal)];
        [button setTitleColor:BA_White_Color];
        button.adjustsImageWhenHighlighted = NO;
        button;
        
    }));
}

@end
