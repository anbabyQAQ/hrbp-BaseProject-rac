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
 *  是否点击返回按键
 */
@property (assign, nonatomic) NSInteger backListCount;

@end

@implementation BaseWebViewController
@dynamic viewModel;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNavigationBar];

}
- (void)setNavigationBar
{
    // 导航栏navigationItem
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
- (void)bindViewModel
{
    [super bindViewModel];
   
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
//    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
//    [self.webView loadURLString:self.viewModel.requestURL];
    [self.webView loadURLString:@"http://192.168.100.62:8080/hrbp/index.html"];

    
    @weakify(self);
    [[self.leftButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(UIButton * x) {
         NSLog(@"button clicked");
         [self backBtnAction:x];
     }];
    
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
                
                if (self.viewModel.webType == kWebHomeFullviewDetailType) {
                    WKScriptMessage *message = tuple.third;
                    if ([message.name isEqualToString:@"getDataFromNative"]) {
                        NSLog(@"WKScriptMessage : %@",message.body[@"callback"]);
                        NSLog(@"WKScriptMessage : %@",message.body[@"params"]);
                        NSLog(@"WKScriptMessage : %@",message.body[@"url"]);
                        NSLog(@"WKScriptMessage : %@",message.body[@"type"]);

                        //{url:url, type:type,callBack:callBack,params:params}
                        NSString *jsFuntion = message.body[@"callback"];
                        NSDictionary *dic = @{@"code":@200,@"status":@"SUCCEED",@"time":@"2017-4-08 18:28:18",@"data":@[@{@"inPostYesRate":@[@{@"proportion":@"50%",@"totalNum":@"630"}],@"inPostNoRate":@[@{@"proportion":@"80%",@"totalNum":@"742"}]}]};
                        NSString *js = [NSString stringWithFormat:@"%@('%@')",jsFuntion,dic.jsonStringEncoded];
                        [self.webView FTD_stringByEvaluatingJavaScriptFromString:js];
                    }
                    if ([message.name isEqualToString:@"callMe"]) {
                        NSString *phoneNum = message.body;
                        
                        NSString *str = [NSString stringWithFormat:@"tel:%@",phoneNum];
                        UIWebView *callWebView = [[UIWebView alloc] init];
                        [callWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
                        [self.view addSubview:callWebView];
                    }
                    if ([message.name isEqualToString:@"calculate"]) {
                        NSString *phoneNum = message.body;
                        NSString *sum = [NSString stringWithFormat:@"%f",[message.body[0] doubleValue] + [message.body[1] doubleValue]];
                        NSString *js = [NSString stringWithFormat:@"showResult('%@')",sum];
                        [self.webView FTD_stringByEvaluatingJavaScriptFromString:js];
                    }
                }
            }
        }];
    
    self.webView.delegate = self;
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
#pragma mark - getter
- (FTDIntegrationWebView *)webView
{
    return HT_LAZY(_webView, ({
        
        NSArray *message = @[@"getDataFromNative"];
        
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

@end
