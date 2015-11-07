//
//  JHBHomePageTableViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/2.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomePageTableViewController.h"
#import "JHBHomePageTableViewCell.h"
#import "JHBHomeHeaderView.h"
#import "JHBHomeView.h"
#import "MBProgressHUD+MoreExtension.h"
#import "JHBHomeShopViewController.h"
#import "JHBHomeClassStoreTableViewController.h"

@interface JHBHomePageTableViewController ()
@property(strong,nonatomic)NSMutableArray * homes;

@end

@implementation JHBHomePageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getMessages];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    JHBHomeHeaderView *headerView = [JHBHomeHeaderView homeHeaderView];
    headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 270.f);
    headerView.pageView.iDisplayTime = 2.f;
    
    [headerView.pageView startAdsWithBlock:@[@"m1",@"m2"] block:^(NSInteger clickIndex){
        NSLog(@"%d",(int)clickIndex);
    }];
    headerView.delegate = self;
    self.tableView.tableHeaderView = headerView;
    
}

#pragma mark headerView代理响应事件
-(void)homeHeaderView:(JHBHomeHeaderView *)view didSendWithButton:(NSString *)sender{
    
    [self performSegueWithIdentifier:@"toClassStore" sender:sender];
    
}

#pragma mark 获取数据
-(void)getMessages{
    [MBProgressHUD showTipToWindow:@"加载中..."];
    PFQuery *query = [PFQuery queryWithClassName:@"homeStore"];
    
    [query  orderByDescending:@"createdAt"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        //3
        if (!error) {
            [_homes removeAllObjects];
            //_array = nil;
            //Everything was correct, put the new objects and load the wall
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            NSArray * arr= [[NSArray alloc] initWithArray:objects];
            //[self saveMessageWithArray:arr];
            for (int i=0; i<arr.count; i++) {
                 JHBHomeView* home=[[JHBHomeView alloc]initWithDictionary:arr[i]];
                
                [_homes addObject:home];
                
                
            }
            
            [self.tableView reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        } else {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            //4
            [MBProgressHUD showTipToWindow:@"网络连接有问题 请检查网络"];
            }
    }];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableArray *)homes{
    if (_homes ==nil) {
        _homes = [NSMutableArray array];
    }
    return _homes;
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.homes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JHBHomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell" forIndexPath:indexPath];
    
    cell.home=self.homes[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"toShop" sender:_homes[indexPath.row]];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[JHBHomeView class]]) {
        JHBHomeShopViewController *shopVC = segue.destinationViewController;
        shopVC.shopModel = sender;
    }else{
        JHBHomeClassStoreTableViewController *storeVC = segue.destinationViewController;
        storeVC.classStore = sender;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 277;
}

@end
