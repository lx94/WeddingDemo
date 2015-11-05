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

@interface JHBHomePageTableViewController ()
@property(strong,nonatomic)NSMutableArray * homes;

@end

@implementation JHBHomePageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    JHBHomeHeaderView *headerView = [JHBHomeHeaderView homeHeaderView];
    headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200.f);
    headerView.pageView.iDisplayTime = 2.f;
    
    [headerView.pageView startAdsWithBlock:@[@"m1",@"m2"] block:^(NSInteger clickIndex){
        NSLog(@"%d",(int)clickIndex);
    }];

    self.tableView.tableHeaderView = headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableArray *)homes{
    _homes=[NSMutableArray array];
    NSDictionary * dict=@{@"pic":@"ew1",
                          @"des":@"我最好？",
                          @"name":@"啥意思？",
                          @"count":@"1200"};
    JHBHomeModel * home=[JHBHomeModel homePageWithDict:dict];
    for (int i=0; i<=9; i++) {
        [_homes addObject:home];
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
    
    cell.homeModel=self.homes[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"toShop" sender:nil];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

@end
