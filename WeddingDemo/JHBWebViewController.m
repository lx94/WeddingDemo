//
//  JHBWebViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBWebViewController.h"
#import "MBProgressHUD+MoreExtension.h"
#import <RDVTabBarController.h>

@interface JHBWebViewController ()

@end

@implementation JHBWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupWebview];
    [self loadWebViewUrl:_url];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[self rdv_tabBarController]setTabBarHidden:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    
    [[self rdv_tabBarController]setTabBarHidden:NO];
}

// 添加webview
- (void)setupWebview
{
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    self.webView = webView;
    self.webView.delegate = self;
}
// 加载网页
- (void)loadWebViewUrl:(NSString *)strUrl
{
    NSURL *url = [NSURL URLWithString:strUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showHUDAddedTo:self.webView LebelText:@"玩命加载中" animated:YES];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideAllHUDsForView:self.webView animated:YES];
}
//-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
//    [MBProgressHUD showTipToWindow:@"网络出现错误"];
//}


@end
