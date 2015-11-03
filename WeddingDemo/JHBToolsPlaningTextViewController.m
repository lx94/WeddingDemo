//
//  JHBToolsPlaningTextViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/25.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsPlaningTextViewController.h"

@interface JHBToolsPlaningTextViewController ()

@end

@implementation JHBToolsPlaningTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightAddClick)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(leftAddClick)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    self.title = _planName.planName;
}

- (void)rightAddClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)leftAddClick
{
    [self.navigationController popViewControllerAnimated:YES];
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
