//
//  WebVC.m
//  AdAlertView
//
//  Created by Superman on 2018/7/20.
//  Copyright © 2018年 Superman. All rights reserved.
//
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#import "WebVC.h"
#import <WebKit/WebKit.h>

@interface WebVC ()<WKUIDelegate,WKNavigationDelegate>


@property (nonatomic, strong) WKWebView *wkWebView;
@property (weak, nonatomic) NSString *baseURLString;

@end

@implementation WebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.wkWebView];
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
}
#pragma mark - WKWebView WKNavigationDelegate 相关
/// 是否允许加载网页 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSString *urlString = [[navigationAction.request URL] absoluteString];
    
    urlString = [urlString stringByRemovingPercentEncoding];
    NSArray *urlComps = [urlString componentsSeparatedByString:@"://"];
    if ([urlComps count]) {
        //        NSString *protocolHead = [urlComps objectAtIndex:0];
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (WKWebView *)wkWebView {
    if (_wkWebView == nil) {
        WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        webView.navigationDelegate = self;
        // 允许左右划手势导航，默认允许
        webView.allowsBackForwardNavigationGestures = YES;
        _wkWebView = webView;
    }
    
    return _wkWebView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
