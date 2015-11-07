//
//  JHBHomeShopViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomeShopViewController.h"
#import "UIBarButtonItem+WB.h"
#import "JHBHomeView.h"
#import "JHBHomeCommentView.h"
#import "JHBHomeViewView.h"


@interface JHBHomeShopViewController ()<JHBHomeViewViewDelegate>
@property (weak,nonatomic) UIScrollView * scrollView;
//@property (weak,nonatomic) UIScrollView * smallscrollView;
@property (strong,nonatomic) NSArray * merchantmessages;
@end

@implementation JHBHomeShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 导航栏左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_back_os7" target:self action:@selector(cancel)];
//
    
    // 收藏按钮
    UIBarButtonItem *rightCollect = [UIBarButtonItem itemWithIcon:@"icon_collect" highlightIcon:@"icon_collect_highlighted" imageScale:0.5 target:self action:@selector(collect)];
    self.navigationItem.rightBarButtonItems = @[ rightCollect];
    self.edgesForExtendedLayout = UIRectEdgeNone;

    [self creatscrollView];
    


}

//- (void) btnClick:(UIButton*)btn
//{
//
//    NSLog(@"4567");
//}
// 退出
- (void)cancel
{
    [self.navigationController popViewControllerAnimated:YES];
}

// 收藏
- (void)collect
{
    
}

//- (NSArray *)merchantmessages
//{
//    if (_merchantmessages == nil) {
//        NSString* path =  [[NSBundle mainBundle] pathForResource:@"JHBHomeMessage.plist" ofType:nil];
//        NSArray * dataArray = [NSArray arrayWithContentsOfFile:path];
//        NSMutableArray * tempArray = [NSMutableArray array];
//        for (int i = 0; i < dataArray.count; i++) {
//             JHBHomeView * message = [JHBHomeView messageWithDictionary:dataArray[i]] ;
//            
//            [tempArray addObject:  message];
//        }
//        _merchantmessages = tempArray;
//    }
//    return _merchantmessages;
//}


- (void)creatscrollView{
    //创建大scrollview
    UIScrollView * scrollView = [[UIScrollView alloc]init];
    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _scrollView = scrollView;
    [self.view addSubview:scrollView];
    //创建小scrollview
//    UIScrollView * smallscrollview = [[UIScrollView alloc]init];
//    smallscrollview.frame = CGRectMake(0, 0, self.view.frame.size.width, 140);
//    [scrollView addSubview:smallscrollview];
    //创建商家view
    JHBHomeViewView* shopview=[JHBHomeViewView JHBHomeViewView];
    shopview.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    shopview.message=_shopModel;
    [scrollView addSubview:shopview];
    [shopview bringSubviewToFront:self.view];
    shopview.delegate = self;
//    NSURL * url = [[NSBundle mainBundle]URLForResource:@"scrollviewPic.plist" withExtension:nil];
//    NSArray * future = [NSArray arrayWithContentsOfURL:url];
//    for (int i = 0; i < future.count; i++) {
//        UIButton * button = [[UIButton alloc]init];
//        UIImageView * imageView = [[UIImageView  alloc]init];
//        NSString * imageStr = future[i];
//        [imageView setImage:[UIImage imageNamed:imageStr]];
//        imageView.frame = CGRectMake(i * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
//        button.frame = imageView.frame;
//        [imageView addSubview:button];
//        [_scrollView addSubview:imageView];
//    }
//    _scrollView.contentSize = CGSizeMake(future.count * _scrollView.frame.size.width, 140);
//   // _scrollView.pagingEnabled = YES;
//    _scrollView.bounces = NO;
//    NSTimer * timer =  [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoPlay) userInfo:nil repeats:YES];
//    
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//    
}

- (void)autoPlay
{
    static int index;
    //_scrollView.contentOffset =  CGPointMake(index * _scrollView.frame.size.width , 0);
    index++;
    
    if (index == 5) {
        index = 0;
    }
}
-(void)ViewView:(JHBHomeViewView *)ViewView btnClick:(UIButton *)btn{

        NSLog(@"haha");
        [self performSegueWithIdentifier:@"totableview" sender:self];
    
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
