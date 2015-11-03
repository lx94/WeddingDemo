//
//  JHBPersonInvitationTableViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/10/19.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBPersonInvitationTableViewController.h"
#import "JHBPersonBarTableViewCell.h"
#import "RRSendMessageViewController.h"
#import "JHBPersonBarMessageModel.h"
#import <MJRefresh.h>
#import <RDVTabBarController.h>

@interface JHBPersonInvitationTableViewController ()

@property (nonatomic, strong) UITextView *message;

@end

@implementation JHBPersonInvitationTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [[self rdv_tabBarController]setTabBarHidden:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    
    [[self rdv_tabBarController]setTabBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //发送按钮
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,25)];
    [rightButton setImage:[UIImage imageNamed:@"send_personBar"]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(SendMessageButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
    
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    
}

#pragma mark 下拉刷新
-(void)loadNewData{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 发送动态点击事件
-(void)SendMessageButtonTapped:(UIButton *)sender{
    RRSendMessageViewController *controller = [[RRSendMessageViewController alloc] init];
    
    [controller presentController:self :^(RRMessageModel *model, BOOL isCancel) {
        if (isCancel == true) {
            self.message.text = @"";
        }
        else {
            self.message.text = model.text;
        }
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 356;
}



- (JHBPersonBarTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = @{@"iconPath":@"icon_00.png",
                           @"name":@"武大郎",
                           @"text":@"好好学习天天向上",
                           @"time":@"10小时前",
                           @"picsPath":@"m1.png",
                           @"count":@"1856"};
    JHBPersonBarMessageModel *model = [JHBPersonBarMessageModel personBarMessageModelWithDict:dict];

    
    static NSString *CellIdentifier = @"personBarCell";
    JHBPersonBarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        cell = [[JHBPersonBarTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.personModel = model;
    
    // Configure the cell...
    
    return cell;
}

@end
