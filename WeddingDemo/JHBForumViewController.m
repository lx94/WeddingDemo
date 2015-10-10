//
//  JHBForumViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/23.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBForumViewController.h"

@interface JHBForumViewController ()

@end

@implementation JHBForumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置弹窗从导航栏下出现
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupMenuView];
    [self setPersonBarButton];
}
-(void)setPersonBarButton{
    UIButton *personBarButton = [[UIButton alloc]init];
    personBarButton.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-200.f, [UIScreen mainScreen].bounds.size.width, 44.f);
    [personBarButton setTitle:@"大家说" forState:UIControlStateNormal];
    [personBarButton setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:personBarButton];
    [personBarButton addTarget:self action:@selector(toPersonBarClicked:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)toPersonBarClicked:(UIButton *)sender{
    [self performSegueWithIdentifier:@"toPersonBar" sender:nil];
}
- (void)setupMenuView
{
    // 消除block强引用
    __typeof (self) __weak weakSelf = self;
    REMenuItem *baiduItem = [[REMenuItem alloc] initWithTitle:@"婚礼十个小细节"
                                                     subtitle:@"全球最大的中文新闻平台"
                                                        image:nil
                                             highlightedImage:nil
                                                       action:^(REMenuItem *item) {
                                                           [self performSegueWithIdentifier:@"toSystemBar" sender:nil];                                                       }];
    REMenuItem *fengItem = [[REMenuItem alloc] initWithTitle:@"婚礼搭配"
                                                    subtitle:@"24小时提供最及时，最权威，最客观的新闻资讯"
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          [self performSegueWithIdentifier:@"toSystemBar" sender:nil];
                                                      }];
    REMenuItem *sinaItem = [[REMenuItem alloc] initWithTitle:@"这样的婚礼你羡慕吗"
                                                    subtitle:@"最新，最快头条新闻一网打尽"
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          [self performSegueWithIdentifier:@"toSystemBar" sender:nil];
                                                      }];
    REMenuItem *tencenItem = [[REMenuItem alloc] initWithTitle:@"结婚吧"
                                                      subtitle:@"中国浏览最大的中文门户网站"
                                                         image:nil
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                            [self performSegueWithIdentifier:@"toSystemBar" sender:nil];
                                                        }];
    REMenuItem *wangyiItem = [[REMenuItem alloc] initWithTitle:@"婚礼幺蛾子"
                                                      subtitle:@"因新闻最快速，评论最犀利而备受推崇"
                                                         image:nil
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                            [self performSegueWithIdentifier:@"toSystemBar" sender:nil];
  
                                                        }];
    REMenuItem *bottomItem = [[REMenuItem alloc] initWithTitle:@"婚礼幺蛾子"
                                                      subtitle:@"因新闻最快速，评论最犀利而备受推崇"
                                                         image:nil
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                            [self performSegueWithIdentifier:@"toSystemBar" sender:nil];
                                                            
                                                        }];

    
    self.menu = [[REMenu alloc] initWithItems:@[fengItem, baiduItem, sinaItem, tencenItem, wangyiItem,bottomItem]];
    self.menu.liveBlur = YES;
    self.menu.liveBlurBackgroundStyle = REMenuLiveBackgroundStyleDark;
    self.menu.textColor = [UIColor whiteColor];
    self.menu.subtitleTextColor = [UIColor whiteColor];
    [self.menu showInView:self.view];
}
// 视图将出现
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (![self.menu isOpen]) {
        [self.menu showInView:self.view];
    }
}

// 视图将消失
- (void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:animated];
    
    if ([self.menu isOpen]) {
        [self.menu close];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
