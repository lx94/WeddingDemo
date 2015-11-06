//
//  JHBToolsSeatingViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsSeatingViewController.h"
#import <Parse/Parse.h>

@interface JHBToolsSeatingViewController ()

@property (weak, nonatomic) IBOutlet UITableView *seatingTableView;
@property (strong, nonatomic) NSMutableArray *muArray;

@end

@implementation JHBToolsSeatingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addSearchBar];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightAddClick)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(leftAddClick)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    self.seatingTableView.backgroundColor = [UIColor clearColor];
    self.seatingTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    self.seatingTableView.delegate = self;
}

-(NSMutableArray *)muArray
{
    if (_muArray == nil)
    {
        _muArray = [NSMutableArray array];
        NSArray * array = _array;
        for (int i=0; i<array.count; i++)
        {
            NSDictionary *dict=array[i];
            JHBSeat *msgModel = [JHBSeat seatMsgModelWithDict:dict];
            JHBSeatFrameModel *frameModel = [JHBSeatFrameModel seatFrameModel:msgModel];
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
    [self performSegueWithIdentifier:@"toAddSeating" sender:nil];
}

- (void)leftAddClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 搜索框
- (void)addSearchBar
{
    UISearchBar *bar=[[UISearchBar alloc]init];
    bar.frame=CGRectMake(0, 64.f, [UIScreen mainScreen].bounds.size.width, 44.f);
    [self.view addSubview:bar];
    bar.delegate=self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if (searchBar.text.length==0)
    {
        UIAlertView *alterView=[[UIAlertView alloc]initWithTitle:@"Prompt Message" message:@"Search bar can't be null,please input the search data." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alterView show];
    }
    else
    {
        
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchBar.text.length==0)
    {
        
    }
    else
    {
        
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.muArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHBToolsSeatViewCell *cell = [JHBToolsSeatViewCell seatTableViewCellWithTableView:tableView];
    cell.frameModel = self.muArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHBSeatFrameModel *msgFrameModel=self.muArray[indexPath.row];
    return msgFrameModel.cellHeight;
}

@end
