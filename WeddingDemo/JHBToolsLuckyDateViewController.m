//
//  JHBToolsLuckyDateViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsLuckyDateViewController.h"

@interface JHBToolsLuckyDateViewController ()

@end

@implementation JHBToolsLuckyDateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(leftAddClick)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self addSubviews];
    [self didloadWebView:_url];
}

- (void)leftAddClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.hidesBackButton = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    self.navigationItem.hidesBackButton = YES;
    [super viewWillDisappear:animated];
}

-(void)addSubviews
{
    UIWebView *webView = [[UIWebView alloc]init];
    _webView.delegate = self;
    _webView = webView;
    [webView addSubview:self.view];
    webView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

-(void)didloadWebView:(NSString *)url
{
    NSURL *loadUrl = [NSURL URLWithString:url];
    [_webView loadRequest:[NSURLRequest requestWithURL:loadUrl]];
    //_webView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [MBProgressHUD showHUDAddedTo:self.view LebelText:@"Please try later." animated:YES];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
