//
//  JHBWebViewController.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHBWebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, copy) NSString *url;

@end
