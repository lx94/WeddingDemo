//
//  JHBMeTableViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBMeTableViewController.h"
#import "AppDelegate.h"
#import "JHBOrderViewController.h"
#import "JHBFavourateViewController.h"
#import "JHBCategoryViewController.h"
@interface JHBMeTableViewController ()
@property(strong,nonatomic)NSArray*JHBMeLists;
@end

@implementation JHBMeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpMeBackGround];
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Me-05"]];
    imageView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    //[self.view addSubview:imageView];
    [self.tableView.window addSubview:imageView];
    _JHBMeLists=@[@"分类",@"收藏",@"订单"];
//    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"退出" style:UIBarButtonItemStyleDone target:self action:@selector(left:)];
   
//   // UIWindow*window=[[UIWindow alloc]init];
//     UIWindow*window=[UIApplication sharedApplication].windows;
//    [window addSubview:imageView];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//-(void)left:(UIBarButtonItem*)item
//{
// [self.navigationController popViewControllerAnimated:YES];
//}
-(void)setUpMeBackGround
{
    UIButton*meButton=[[UIButton alloc]init];
    meButton.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3);
    [meButton setBackgroundImage:[UIImage imageNamed:@"Me-1"] forState:UIControlStateNormal];
    self.tableView.tableHeaderView=meButton;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.JHBMeLists.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
       [self performSegueWithIdentifier:@"toCateGory" sender:nil];
        //NSLog(@"%@",_JHBMeLists[0]);
        
    }else
    {
        if (indexPath.row==1) {
           [self performSegueWithIdentifier:@"toFavourate" sender:nil];
             //NSLog(@"%@",_JHBMeLists[1]);
        }else
        {
            [self performSegueWithIdentifier:@"toOrder" sender:nil];
             //NSLog(@"%@",_JHBMeLists[2]);
        }
    
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text=_JHBMeLists[indexPath.row];
    return cell;
}
@end
