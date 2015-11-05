//
//  JHBSystemInvitationTableViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/18.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBSystemInvitationTableViewController.h"
#import "NSString+MoreExtentions.h"
#import "JHBSystemBarModel.h"
#import <RDVTabBarController.h>
#import <Parse/Parse.h>
#import <MBProgressHUD.h>
#define kessayTitleFont [UIFont systemFontOfSize:23.f]
#define kauthorNameFont [UIFont systemFontOfSize:14.f]
#define kessayFont [UIFont systemFontOfSize:20.f]

static NSString *const menuCellIdentifier = @"rotationCell";
@interface JHBSystemInvitationTableViewController ()

@property (nonatomic, strong) NSArray *menuTitles;
@property (nonatomic, strong) NSArray *menuIcons;

@property (strong,nonatomic) JHBSystemBarModel *essayModel;

@end

@implementation JHBSystemInvitationTableViewController

-(void)setModel{
    if ([PFUser currentUser]) {
        PFQuery *query = [PFQuery queryWithClassName:@"WeddingDemo"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            //3
            
            if (!error) {
                
                NSArray*  array = [[NSArray alloc]initWithArray:objects];
                
                for (int i=(int)array.count - 1; i>=0 ;i--) {
                    PFObject* file=array[i];
                    PFFile * icon = (PFFile *)[file objectForKey:@"image"];
                    NSString * essayTitle = (NSString *)[file objectForKey:@"title"];
                    NSString * essay = (NSString *)[file objectForKey:@"text"];
                    NSString * authorName = (NSString *)[file objectForKey:@"authorName"];
                    
                    NSDictionary * dict = @{@"essayTitle":essayTitle,@"essay":essay,@"authorName":authorName,@"image":icon};
                    self.essayModel = [JHBSystemBarModel systemBarModelWithDict:dict];
                    UIImageView *pic = [[UIImageView alloc]init];
                    pic.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
                    PFFile* image=self.essayModel.icon;
                    [image getDataInBackgroundWithBlock: ^(NSData *PF_NULLABLE_S data, NSError *PF_NULLABLE_S error){
                        if (!error) {
                            UIImage * img = [UIImage imageWithData:data];
                            [pic setImage:img];
                        } else {
                            //4
                            NSString *errorString = [[error userInfo] objectForKey:@"error"];
                            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                            [errorAlertView show];
                        }
                    }];
                    self.tableView.tableHeaderView = pic;
                    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
                    [self.tableView reloadData];
                    [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
                    
                }
            }
        }];
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    [self setModel];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [[self rdv_tabBarController]setTabBarHidden:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    
    [[self rdv_tabBarController]setTabBarHidden:NO];
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
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EssayTitleCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.row ==0) {
        cell.textLabel.text = self.essayModel.essayTitle;
        cell.textLabel.font = kessayTitleFont;
        cell.textLabel.numberOfLines = [self.essayModel.essayTitle heightForWidth:([UIScreen mainScreen].bounds.size.width-40.f) Font:kessayTitleFont]/14.f;
    }else if (indexPath.row ==1){
        cell.textLabel.text = self.essayModel.authorName;
        cell.textLabel.font = kauthorNameFont;
    }else{
        cell.textLabel.text = self.essayModel.essay;
        cell.textLabel.font = kessayFont;
        cell.textLabel.numberOfLines = [self.essayModel.essay heightForWidth:[UIScreen mainScreen].bounds.size.width Font:kessayFont]/8.f;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        CGFloat height = [self.essayModel.essayTitle heightForWidth:([UIScreen mainScreen].bounds.size.width-40.f) Font:kessayTitleFont];
        return height+10;
    }else if (indexPath.row ==1){
        CGFloat height = [self.essayModel.authorName heightForWidth:[UIScreen mainScreen].bounds.size.width Font:kauthorNameFont];
        return height+10;
        
    }else{
        CGFloat height = [self.essayModel.essay heightForWidth:([UIScreen mainScreen].bounds.size.width-35.f) Font:kessayFont];
        return height+10;
        
    }
}


@end
