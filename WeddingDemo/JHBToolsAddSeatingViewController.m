//
//  JHBToolsAddSeatingViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsAddSeatingViewController.h"

#define XMargin 5.f
#define YMargin 70.f
#define TEXTFONT [UIFont systemFontOfSize:14.f]

@interface JHBToolsAddSeatingViewController ()

@end

@implementation JHBToolsAddSeatingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addSubViews];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightAddClick)];
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
    if (_deskID.text.length == 0)
    {
        MBProgressHUD *hud=[[MBProgressHUD alloc]init];
        hud.frame=CGRectMake([UIScreen mainScreen].bounds.size.width*0.5, [UIScreen mainScreen].bounds.size.height*0.5, 100.f, 50.f);
        hud.labelText=@"桌号不能为空";
        hud.mode=MBProgressHUDModeCustomView;
        [hud show:YES];
        [self.view addSubview:hud];
        [hud hide:YES afterDelay:3.f];
    }
    else if (_customerName.text.length == 0)
    {
        MBProgressHUD *hud=[[MBProgressHUD alloc]init];
        hud.frame=CGRectMake([UIScreen mainScreen].bounds.size.width*0.5, [UIScreen mainScreen].bounds.size.height*0.5, 100.f, 50.f);
        hud.labelText=@"宾客名称不能为空";
        hud.mode=MBProgressHUDModeCustomView;
        [hud show:YES];
        [self.view addSubview:hud];
        [hud hide:YES afterDelay:3.f];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];

    }
}

- (void)leftAddClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addSubViews
{
    UITextField *deskID = [[UITextField alloc]init];
    deskID.frame = CGRectMake(XMargin, YMargin, [UIScreen mainScreen].bounds.size.width - 2 * XMargin, 44.f);
    deskID.borderStyle = UITextBorderStyleRoundedRect;
    deskID.textAlignment = NSTextAlignmentCenter;
    deskID.font = TEXTFONT;
    deskID.placeholder=@"请输入桌名（如：新郎大学同学桌）";
    deskID.alpha = 0.7;
    _deskID = deskID;
    [self.view addSubview:_deskID];
    
    UITextField *customerName = [[UITextField alloc]init];
    customerName.frame = CGRectMake(XMargin, _deskID.height + YMargin + XMargin, [UIScreen mainScreen].bounds.size.width - 2 * XMargin, 200.f);
    customerName.borderStyle = UITextBorderStyleRoundedRect;
    customerName.textAlignment = NSTextAlignmentCenter;
    customerName.placeholder=@"点击输入宾客信息，姓名之间用“空格”分开";
    customerName.font = TEXTFONT;
    customerName.alpha = 0.7;
    _customerName = customerName;
    [self.view addSubview:_customerName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
