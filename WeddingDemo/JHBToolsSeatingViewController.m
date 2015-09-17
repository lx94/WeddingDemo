//
//  JHBToolsSeatingViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsSeatingViewController.h"

@interface JHBToolsSeatingViewController ()

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
