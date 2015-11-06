//
//  JHBToolsLoveJourneyViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsLoveJourneyViewController.h"
#import "JHBToolsStoryViewCell.h"
#import <Parse/Parse.h>
#import "MJRefresh.h"
#import "MJRefreshNormalHeader.h"

@interface JHBToolsLoveJourneyViewController ()

@property (weak, nonatomic) IBOutlet UITableView *storyTableView;
@property (strong, nonatomic) NSMutableArray *muArray;
@property (strong,nonatomic)NSArray * array;

@end

@implementation JHBToolsLoveJourneyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightAddClick)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(leftAddClick)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    self.storyTableView.backgroundColor = [UIColor clearColor];
    self.storyTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    
    self.storyTableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    

    
}

-(void)loadNewData
{
    [self.storyTableView.header beginRefreshing];
        PFQuery * query = [PFQuery queryWithClassName:@"JHBToolsStory"];
        [query findObjectsInBackgroundWithBlock:^(NSArray * objects,NSError * error){
            if(!error){
                _muArray=nil;
                [CoreDataMngTool deleteAllMsg];
                for (int i=0; i<objects.count; i++) {
                    [JHBStory storyMsgModelWithDict:objects[i]];
                }
                [self.storyTableView reloadData];
                [self.storyTableView.header endRefreshing];
                          }}];
}

-(NSMutableArray *)muArray
{
    if (_muArray == nil)
    {
        _muArray = [NSMutableArray array];
        for (int i=0; i<[CoreDataMngTool searchAllStroyLists].count; i++) {
            JHBStoryFrameModel * frameModel=[JHBStoryFrameModel stroyFrameModel:[CoreDataMngTool searchAllStroyLists][i]];
            [_muArray addObject:frameModel];
        }
    
        }
        
        
        
    
    return _muArray;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.hidesBackButton = YES;
    [self.storyTableView.header beginRefreshing];
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    self.navigationItem.hidesBackButton = YES;
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)rightAddClick
{
    [self performSegueWithIdentifier:@"toOurStory" sender:nil];
}

- (void)leftAddClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHBToolsStoryViewCell *cell = [JHBToolsStoryViewCell storyTableViewCellWithTableView:tableView];
    cell.frameModel = self.muArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.muArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHBStoryFrameModel *msgFrameModel=self.muArray[indexPath.row];
    return msgFrameModel.cellHeight;
}

@end
