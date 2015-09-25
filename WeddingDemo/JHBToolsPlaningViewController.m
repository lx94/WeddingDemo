//
//  JHBToolsPlaningViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsPlaningViewController.h"

#define XMargin 5.f
#define YMargin 70.f
#define HEIGHT 64.f
#define BUTTONCOUNT 6
#define TOOLBUTTONWIDTH 200.f
#define TOOLBUTTONHEIGHT 44.f
#define BUTTONFONT [UIFont systemFontOfSize:18.f]

@interface JHBToolsPlaningViewController ()

@end

@implementation JHBToolsPlaningViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(leftAddClick)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    [self addSubViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.hidesBackButton = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    self.navigationItem.hidesBackButton = YES;
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

#pragma mark 导航栏左侧按钮点击事件
- (void)leftAddClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 添加控件
- (void)addSubViews
{
    CGFloat w = TOOLBUTTONWIDTH;
    CGFloat h = TOOLBUTTONHEIGHT;
    for (int i = 0; i < BUTTONCOUNT; i++)
    {
        UIButton *planButton = [[UIButton alloc]init];
        UIView *underLine = [[UIView alloc]init];
        underLine.backgroundColor = [UIColor colorWithRed:227.f/255.f green:227.f/255.f blue:227.f/255.f alpha:1];

        
        if (i % 2 == 0)
        {
            planButton.frame = CGRectMake(2*XMargin,2*XMargin+(2*XMargin+TOOLBUTTONHEIGHT)*i+YMargin+2*XMargin, w, h);
            underLine.frame = CGRectMake(0, planButton.bottom+XMargin, planButton.width, 1);
        }
        else
        {
            planButton.frame = CGRectMake(2*XMargin+([UIScreen mainScreen].bounds.size.width-2*XMargin-w),2*XMargin+(2*XMargin+TOOLBUTTONHEIGHT)*i+YMargin+2*XMargin, w, h);
            underLine.frame = CGRectMake(planButton.left, planButton.bottom+XMargin, planButton.width, 1);
        }
        
        switch (i)
        {
            case 0:
                [planButton setTitle:@"婚宴场地" forState:UIControlStateNormal];
                [planButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                planButton.titleLabel.font = BUTTONFONT;
                break;
            case 1:
                [planButton setTitle:@"婚礼服饰" forState:UIControlStateNormal];
                [planButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                planButton.titleLabel.font = BUTTONFONT;
                break;
            case 2:
                [planButton setTitle:@"场馆道具" forState:UIControlStateNormal];
                [planButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                planButton.titleLabel.font = BUTTONFONT;
                break;
            case 3:
                [planButton setTitle:@"婚宴仪式" forState:UIControlStateNormal];
                [planButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                planButton.titleLabel.font = BUTTONFONT;
                break;
            case 4:
                [planButton setTitle:@"花艺布置" forState:UIControlStateNormal];
                [planButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                planButton.titleLabel.font = BUTTONFONT;
                break;
            case 5:
                [planButton setTitle:@"主题婚礼" forState:UIControlStateNormal];
                [planButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                planButton.titleLabel.font = BUTTONFONT;
                break;
            default:
                break;
        }
        [planButton addTarget:self action:@selector(planButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:planButton];
        [self.view addSubview:underLine];
    }
}

- (void)planButtonClick
{
    [self performSegueWithIdentifier:@"toContent" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
