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

static int numcount = 0;

- (void)viewWillAppear:(BOOL)animated
{
    [[self rdv_tabBarController]setTabBarHidden:YES];
    //刷新获取数据
    self.tableView.header =
    [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getMessages)];
    //[self.tableView.header beginRefreshing];
    if (numcount ==0) {
        [self.tableView.header beginRefreshing];
    }
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMessages)];
    [self.tableView.footer beginRefreshing];
    numcount++;
    
    _userName = [[NSUserDefaults standardUserDefaults]objectForKey:@"cleverName"];
    _icon = [[NSUserDefaults standardUserDefaults]objectForKey:@"icon"];

}
- (void)viewWillDisappear:(BOOL)animated
{
    
    [[self rdv_tabBarController]setTabBarHidden:NO];
}

-(NSMutableArray *)array{
    if (_array ==nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    
    _userName = @"武大郎";
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
#pragma mark cell代理事件
-(void)personBarTableViewCell:(JHBPersonBarTableViewCell *)cell{
    NSLog(@"123");
}

#pragma mark 发送动态点击事件
-(void)SendMessageButtonTapped:(UIButton *)sender{
    RRSendMessageViewController *controller = [[RRSendMessageViewController alloc] init];
    
    [controller presentController:self :^(RRMessageModel *model, BOOL isCancel) {
        if (isCancel == true||model.text.length == 0) {
//            self.message.text = @"";
        }
        else {
             [self uploadWithModel:model];
            if (model.photos.count>0) {
               
            }else{
                [MBProgressHUD showTipToWindow:@"请选择一张图片"];
            }
            
        }
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
}
#pragma mark 上传动态
-(void)uploadWithModel:(RRMessageModel *)model{
    //NSMutableArray *array = [NSMutableArray array];
    NSData *pictureData = nil;
    PFFile *file = nil;
    NSData *iconData = UIImagePNGRepresentation([UIImage imageNamed:@"defaultIcon"]);
    PFFile *iconFile = [PFFile fileWithName:[NSString stringWithFormat:@"defaultIcon"] data:iconData];

    if (model.photos.count>0) {
        pictureData  = UIImagePNGRepresentation(model.photos[0]);
        file = [PFFile fileWithName:[NSString stringWithFormat:@"pic"] data:pictureData];
        [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if (succeeded){
                
                PFObject *imageObject = [PFObject objectWithClassName:@"personBarMessage"];
                
                [imageObject setObject:_userName forKey:@"user"];
                [imageObject setObject:file forKey:@"pic"];
                [imageObject setObject:iconFile forKey:@"icon"];
                
                [imageObject setObject:model.text forKey:@"text"];
                [imageObject setObject:@"1" forKey:@"count"];
                
                [imageObject setObject:_userName forKey:@"name"];
                //3
                [imageObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    //4
                    if (succeeded){
                        JHBPersonModel *personModel = [JHBPersonModel personBarModelWithDict:imageObject];
                        JHBPersonFrameModel *frameModel = [JHBPersonFrameModel personFrameModelWithPersonModel:personModel];
                        [_array insertObject:frameModel atIndex:0];
                        [self.tableView reloadData];
                        
                        [imageObject fetchInBackground];
                        //Go back to the wall
                        //[self.navigationController popViewControllerAnimated:YES];
                        NSLog(@"upload Success");
                    }
                    else{
                        //NSString *errorString = [[error userInfo] objectForKey:@"error"];
                        [MBProgressHUD showTipToWindow:@"网络连接有问题 请检查网络"];
                    }
                }];


            }
            else{
                
                [MBProgressHUD showTipToWindow:@"网络连接有问题 请检查网络"];
            }
        } progressBlock:^(int percentDone) {
            NSLog(@"Uploaded: %d %%", percentDone);
            
        }];
    }
    
    
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
    cell.delegate = self;
    
    
    // Configure the cell...
    
    return cell;
}

#pragma mark 获取信息
-(void)getMessages{
    static int num = 0;
    
    num +=5;
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES ];
    PFQuery *query = [PFQuery queryWithClassName:@"personBarMessage"];
    
    [query  orderByDescending:@"createdAt"];
    query.limit = num;
    query.skip = 0;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        //3
        if (!error) {
            [_array removeAllObjects];
            //_array = nil;
            //Everything was correct, put the new objects and load the wall
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            NSArray * arr= [[NSArray alloc] initWithArray:objects];
            //[self saveMessageWithArray:arr];
            for (int i=0; i<arr.count; i++) {
                JHBPersonModel *personModel = [JHBPersonModel personBarModelWithDict:arr[i]];
                JHBPersonFrameModel *frameModel = [JHBPersonFrameModel personFrameModelWithPersonModel:personModel];
                
                [_array addObject:frameModel];
                //NSLog(@"%@",objects);
                
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
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            
            //4
            [MBProgressHUD showTipToWindow:@"网络连接有问题 请检查网络"];
            [self.tableView.header endRefreshing];
            [self.tableView.footer endRefreshing];
        }
    }];
    
    
}
@end
