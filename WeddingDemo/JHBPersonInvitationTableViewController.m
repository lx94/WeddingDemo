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
#import "JHBPersonFrameModel.h"
#import <MJRefresh.h>
#import <RDVTabBarController.h>
#import <Parse/Parse.h>
#import "MBProgressHUD+MoreExtension.h"

@interface JHBPersonInvitationTableViewController ()

@property (nonatomic, strong) UITextView *message;

@property (strong,nonatomic) NSMutableArray *array;

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
    
    _array = [NSMutableArray array];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    //刷新获取数据
    self.tableView.header =
    [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getMessages)];
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMessages)];
    [self.tableView.footer beginRefreshing];

    
    //发送按钮
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,25)];
    [rightButton setImage:[UIImage imageNamed:@"send_personBar"]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(SendMessageButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
    
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
    return self.array.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHBPersonFrameModel *personFrameModel = self.array[indexPath.row];
    return personFrameModel.cellHeight;
}



- (JHBPersonBarTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHBPersonFrameModel *personFrameModel = self.array[indexPath.row];

    static NSString *CellIdentifier = @"personBarCell";
    JHBPersonBarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        cell = [[JHBPersonBarTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.personFrameModel = personFrameModel;
    
    
    // Configure the cell...
    
    return cell;
}

#pragma mark 获取信息
-(void)getMessages{
    static int num = 0;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES ];
    PFQuery *query = [PFQuery queryWithClassName:@"personBarMessage"];
    
    [query  orderByDescending:@"createdAt"];
    query.limit = 5;
    query.skip = num;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        //3
        if (!error) {
            //Everything was correct, put the new objects and load the wall
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSArray * arr= [[NSArray alloc] initWithArray:objects];
            //[self saveMessageWithArray:arr];
            for (int i=0; i<arr.count; i++) {
                JHBPersonModel *personModel = [JHBPersonModel personBarModelWithDict:arr[i]];
                JHBPersonFrameModel *frameModel = [JHBPersonFrameModel personFrameModelWithPersonModel:personModel];
                
                [_array addObject:frameModel];
                
            }
            [self.tableView reloadData];
            if (arr.count<5) {
                [self.tableView.footer noticeNoMoreData];
                [self.tableView reloadData];
            }else{
                [self.tableView.footer endRefreshing];
            }
            [self.tableView.header endRefreshing];
        } else {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            //4
            [MBProgressHUD showTipToWindow:@"网络连接有问题 请检查网络"];
            [self.tableView.header endRefreshing];
            [self.tableView.footer endRefreshing];
        }
    }];
    
    num +=5;
    
}
@end
