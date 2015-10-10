//
//  JHBPersonInvitationViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBPersonInvitationViewController.h"
#import "JHBAdPageView.h"
#import <RDVTabBarController.h>
@interface JHBPersonInvitationViewController ()
@property(nonatomic,strong)JHBAdPageView    *adView;
@property (weak, nonatomic) IBOutlet UITableView *PersonBarTableView;

@end

@implementation JHBPersonInvitationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self setUpPageView];
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //_PersonBarTableView.contentInset = UIEdgeInsetsMake(0.f, 0.f, 44.f, 0.f);
    [self.view addSubview:_PersonBarTableView];
    

}
//#pragma mark 设置图片轮播
//-(void)setUpPageView{
//    _adView = [[JHBAdPageView alloc] initWithFrame:CGRectMake(0,30.f, [UIScreen mainScreen].bounds.size.width, 160)];
//    self.PersonBarTableView.tableHeaderView = _adView;
//    _adView.iDisplayTime = 2;
//    [_adView startAdsWithBlock:@[@"m1",@"m2",@"m3",@"m4",@"m5"] block:^(NSInteger clickIndex){
//        NSLog(@"%d",(int)clickIndex);
//    }];
//    self.PersonBarTableView.tableHeaderView = _adView;
//}

#pragma mark 设置个人贴的tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellID = @"PersonBarCell";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    if (cell !=nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    cell.textLabel.text = @"个人区";
    cell.detailTextLabel.text = @"内容简介";
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [[self rdv_tabBarController]setTabBarHidden:YES];
}
-(void)viewWillDisappear:(BOOL)animated{
    [[self rdv_tabBarController]setTabBarHidden:NO];
    
}
@end
