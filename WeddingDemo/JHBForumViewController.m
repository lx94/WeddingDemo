//
//  JHBForumViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/23.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBForumViewController.h"
#import "JHBWebViewController.h"
#import "UIView+Extension.h"

#define kbuttonWith 80.f
#define zhenaiNewUrl @"http://www.zhenai.com"
#define xijieNewUrl @"http://www.likewed.com"
#define jiujiuNewUrl @"http://www.99wed.com"
#define hunqingNewUrl @"http://www.wedding86.com"
#define buttontextColor [UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1]


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
    
    personBarButton.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-kbuttonWith)*0.5, [UIScreen mainScreen].bounds.size.height-240.f, kbuttonWith, kbuttonWith);
    [personBarButton setBackgroundImage:[UIImage imageNamed:@"wedding_2"] forState:UIControlStateNormal];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(personBarButton.frame), CGRectGetMaxY(personBarButton.frame), kbuttonWith, 0.5*kbuttonWith)];
    label.text = @"纪录幸福";
    label.textColor = buttontextColor;
    label.textAlignment = NSTextAlignmentCenter;

    [self.view addSubview:label];
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
    
    REMenuItem *jiujiuItem = [[REMenuItem alloc] initWithTitle:@"久久结婚"
                                                     subtitle:@"中国第一结婚门户网"
                                                        image:nil
                                             highlightedImage:nil
                                                       action:^(REMenuItem *item) {
                                                           [weakSelf loadWebViewWith:jiujiuNewUrl];                                                    }];
    REMenuItem *xijieItem = [[REMenuItem alloc] initWithTitle:@"喜结网"
                                                    subtitle:@"让你的婚礼更轻松"
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          [weakSelf loadWebViewWith:xijieNewUrl];
                                                      }];
    REMenuItem *zhenaiItem = [[REMenuItem alloc] initWithTitle:@"珍爱网"
                                                    subtitle:@"相亲无难事，珍爱有红娘"
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          [weakSelf loadWebViewWith:zhenaiNewUrl];
                                                      }];
    REMenuItem *hunqingItem = [[REMenuItem alloc] initWithTitle:@"中国婚庆网"
                                                      subtitle:@"你想要的婚礼，就在我们这里"
                                                         image:nil
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                            [weakSelf loadWebViewWith:hunqingNewUrl];
                                                        }];
    REMenuItem *newItem = [[REMenuItem alloc] initWithTitle:@"每日贴示"
                                                      subtitle:@"每天的清晨，带给你不同的惊喜"
                                                         image:nil
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                            [weakSelf performSegueWithIdentifier:@"toSystemBar" sender:nil];
  
                                                        }];

    
    self.menu = [[REMenu alloc] initWithItems:@[hunqingItem, xijieItem, jiujiuItem, zhenaiItem, newItem]];
    
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

-(void)loadWebViewWith:(NSString *)url{
    [self performSegueWithIdentifier:@"toWebView" sender:url];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (sender !=nil) {
        JHBWebViewController *webVC = segue.destinationViewController;
        webVC.url = sender;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
