/* !:
 * @FileName   :   FTDIntegrationWebView.h
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@class FTDIntegrationWebView;

@protocol FTDIntegrationWebViewDelegate <NSObject>

@optional
/**
 *  webview内容的标题
 */
- (void)FTD_WebView:(FTDIntegrationWebView *)webview title:(NSString *)title;
/**
 *  webview监听
 */
- (void)FTD_WebView:(FTDIntegrationWebView *)webview shouldStartLoadWithURL:(NSURL *)URL;
/**
 *  webview开始加载
 */
- (void)FTD_WebViewDidStartLoad:(FTDIntegrationWebView *)webview;
/**
 *  webview加载完成
 */
- (void)FTD_WebView:(FTDIntegrationWebView *)webview didFinishLoadingURL:(NSURL *)URL;
/**
 *  webview加载失败
 */
- (void)FTD_WebView:(FTDIntegrationWebView *)webview didFailToLoadURL:(NSURL *)URL error:(NSError *)error;
/**
 *  webview OB-JS交互
 */
- (void)FTD_WebView:(FTDIntegrationWebView *)webview userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;
@end

/********** 将webView与WKWebView集成 ***********/
@interface FTDIntegrationWebView : UIView<WKNavigationDelegate, WKUIDelegate, UIWebViewDelegate,WKScriptMessageHandler>

#pragma mark - Public Properties
/**
 *  FTDIntegrationWebView代理
 */
@property (nonatomic, weak) id <FTDIntegrationWebViewDelegate> delegate;
/**
 *  加载时导航栏底部的进度条
 */
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *barTintColor;

@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) UIWebView *uiWebView;

/**
 *  是否可以返回上级页面
 */
@property (nonatomic, readonly) BOOL canGoBack;
/**
 *  是否可以进入下级页面
 */
@property (nonatomic, readonly) BOOL canGoForward;

#pragma mark - Initializers view
/**
 *  初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame ;

#pragma mark - Initializers view
/**
 *  初始化方法 以及 OC-JS交互规则
 */
- (instancetype)initWithFrame:(CGRect)frame WithConfiguration:(NSArray *)configuration;

#pragma mark - Public Interface
/**
 *  返回上一级页面
 */
- (void)goBack;
/**
 *  进入下一级页面
 */
- (void)goForward;
/**
 *  加载一个webview
 *
 *  @param request 请求的NSURLURLRequest
 */
- (void)loadRequest:(NSURLRequest *)request;
/**
 *  加载一个webview
 *
 *  @param request 请求的URL
 */
- (void)loadURL:(NSURL *)URL;
/**
 *  加载一个webview
 *
 *  @param request 请求的URLString
 */
- (void)loadURLString:(NSString *)URLString;
/**
 *  加载本地网页
 *
 *  @param request 请求的地址
 */
- (void)loadHTMLString:(NSString *)HTMLString;
/**
 *  加载本地js方法
 *
 *  @param request js字符串
 */
- (void)FTD_stringByEvaluatingJavaScriptFromString:(NSString *)jsString;
@end
