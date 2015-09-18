//
//  JHBForumTableViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBForumTableViewController.h"
#import "JHBAdPageView.h"
@interface JHBForumTableViewController ()
@property(nonatomic,strong)JHBAdPageView    *adView;
@end

@implementation JHBForumTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _adView = [[JHBAdPageView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 100)];
    _adView.iDisplayTime = 2;
    [_adView startAdsWithBlock:@[@"m1",@"m2",@"m3",@"m4",@"m5"] block:^(NSInteger clickIndex){
        NSLog(@"%d",(int)clickIndex);
    }];

    self.tableView.tableHeaderView = _adView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section ==0) {
        return 7;
    }else{
        return 12;
    }
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //1.定义一个重复利用的id
    static NSString *reusedID = nil;
    if (indexPath.section == 0) {
        reusedID = @"JHBForumCell1";
    }else{
        reusedID = @"JHBForumCell2";
    }
    //2.从内存池看有无可重复利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedID];
    
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedID];
    }
    NSString *cellText = @"阿斯利康发噶复古拉链给发放噶咖啡噶时光镂空黑色礼服更何况撒娇富士康哥萨克发噶开始发高烧咖啡馆卡事故发生开个罚单开割发代首开发的萨克斯管发贺卡是法国哈萨克里贡多克斯感到十分关怀的手";

    // Configure the cell...
    if (indexPath.section ==0) {
        cell.detailTextLabel.text = @"ahlfkakfjhagja";
        cell.textLabel.text = @"123";
        cell.imageView.image = [UIImage imageNamed:@"icon_00"];
    }else{
        cell.textLabel.text = @"我是天才";
        cell.detailTextLabel.text = cellText;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==1) {
        return 80;
    }else{
        return 60;
        
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        [self performSegueWithIdentifier:@"toSystemBar" sender:nil];
    }else{
        [self performSegueWithIdentifier:@"toPersonBar" sender:nil];
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        return @"系统的";
    }else{
        return @"我的";
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

@end
