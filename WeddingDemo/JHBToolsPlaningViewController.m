//
//  JHBToolsPlaningViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/25.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsPlaningViewController.h"

#define HEIGHT 64.f
#define BUTTONCOUNT 6
#define COLUMNNUM 2
#define ROWNUM (BUTTONCOUNT/COLUMNNUM)
#define TOOLBUTTONWIDTH 200.f
#define TOOLBUTTONHEIGHT 45.f
#define BUTTONFONT [UIFont systemFontOfSize:18.f]
#define kMargin 10.f

@interface JHBToolsPlaningViewController ()

@end

@implementation JHBToolsPlaningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightAddClick)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(leftAddClick)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    [self addSubViews];
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

#pragma mark 添加控件
- (void)addSubViews
{
    CGFloat w =TOOLBUTTONWIDTH;
    CGFloat h =TOOLBUTTONHEIGHT;
    
    for (int i = 0; i < BUTTONCOUNT; i++)
    {
        UIButton *toolsButton = [[UIButton alloc]init];
        [toolsButton setTitleColor:[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1] forState:UIControlStateNormal];
        [toolsButton setTitleColor:[UIColor colorWithRed:111.f/255.f green:44.f/255.f blue:37.f/255.f alpha:1] forState:UIControlStateHighlighted];
        toolsButton.titleLabel.font = BUTTONFONT;
        
        UIView *underline = [[UIView alloc]init];
        underline.backgroundColor = [UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1];
        
        if (i % COLUMNNUM == 0)
        {
            toolsButton.frame = CGRectMake(kMargin/2.f, 6*
                                          kMargin+HEIGHT+TOOLBUTTONHEIGHT*i, w, h);
            underline.frame = CGRectMake(0, toolsButton.bottom, TOOLBUTTONWIDTH-kMargin, 1);
        }
        else
        {
            toolsButton.frame = CGRectMake(kMargin/2.f+165.f, 6*
                                           kMargin+HEIGHT+TOOLBUTTONHEIGHT*i, w, h);
            underline.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-TOOLBUTTONWIDTH+kMargin, toolsButton.bottom, TOOLBUTTONWIDTH-kMargin, 1);
        }
        
        switch (i)
        {
            case 0:
                [toolsButton setTitle:@"婚宴场地" forState:UIControlStateNormal];
                break;
            case 1:
                [toolsButton setTitle:@"婚礼服饰" forState:UIControlStateNormal];
                break;
            case 2:
                [toolsButton setTitle:@"场馆道具" forState:UIControlStateNormal];
                break;
            case 3:
                [toolsButton setTitle:@"婚宴仪式" forState:UIControlStateNormal];
                break;
            case 4:
                [toolsButton setTitle:@"花艺布置" forState:UIControlStateNormal];
                break;
            case 5:
                [toolsButton setTitle:@"主题婚礼" forState:UIControlStateNormal];
                break;
            default:
                break;
        }
        [toolsButton addTarget:self action:@selector(textButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:toolsButton];
        [self.view addSubview:underline];
        _planName = toolsButton.titleLabel.text;
    }
}

-(void)textButtonClicked
{
    [self performSegueWithIdentifier:@"toPlaningText" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
