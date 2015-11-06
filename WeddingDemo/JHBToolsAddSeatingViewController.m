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
    [self layoutSubviews];
    
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

-(void)viewDidAppear:(BOOL)animated
{
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [_customerName addGestureRecognizer:tap];
}

-(void)tap:(UITapGestureRecognizer*)rec
{
    _msgLabel.hidden = YES;
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

- (void)saveButtonClick
{
    if (_customerName.text.length == 0 || _deskID.text.length == 0)
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
    }
    else
    {
        PFObject * object = [PFObject objectWithClassName:@"JHBToolsSeating"];
        [object setObject:_deskID.text forKey:@"deskID"];
        [object setObject:_customerName.text forKey:@"customerName"];
        
        [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
         {
             if (!succeeded)
             {
                 //Go back to the wall
                 NSString *errorString = [[error userInfo] objectForKey:@"error"];
                 UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                 [errorAlertView show];
             }
             else
             {
                 
             }
         }];
    }
}

- (void)addSubViews
{
    UITextField *deskID = [[UITextField alloc]init];
    deskID.borderStyle = UITextBorderStyleRoundedRect;
    deskID.textAlignment = NSTextAlignmentCenter;
    deskID.font = TEXTFONT;
    deskID.placeholder=@"请输入桌名（如：新郎大学同学桌）";
    deskID.alpha = 0.7;
    _deskID = deskID;
    [self.view addSubview:_deskID];
    
    UITextView *customerName = [[UITextView alloc]init];
    customerName.font = TEXTFONT;
    customerName.alpha = 0.7;
    _customerName = customerName;
    [self.view addSubview:_customerName];
    
    UILabel *msgLabel = [[UILabel alloc]init];
    msgLabel.text = @"点击输入宾客信息";
    msgLabel.alpha = 0.7;
    _msgLabel = msgLabel;
    msgLabel.numberOfLines = 0;
    msgLabel.font = TEXTFONT;
    msgLabel.textAlignment = NSTextAlignmentCenter;
        [_customerName addSubview:msgLabel];
    
    UIButton *saveButton = [[UIButton alloc]init];
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    saveButton.titleLabel.font = TEXTFONT;
    saveButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [saveButton setTitleColor:[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1] forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor colorWithRed:111.f/255.f green:44.f/255.f blue:37.f/255.f alpha:1] forState:UIControlStateHighlighted];
    [saveButton addTarget:self action:@selector(saveButtonClick) forControlEvents:UIControlEventTouchUpInside];
    _saveButton = saveButton;
    [self.view addSubview:_saveButton];
}

-(void)layoutSubviews
{
    _deskID.frame = CGRectMake(XMargin, YMargin, [UIScreen mainScreen].bounds.size.width - 2 * XMargin, 44.f);
    
    _customerName.frame = CGRectMake(XMargin, _deskID.height + YMargin + XMargin, [UIScreen mainScreen].bounds.size.width - 2 * XMargin, 200.f);
    
    CGFloat msgLabelW = [_msgLabel.text widthForWidth:_customerName.width Font:TEXTFONT];
    CGFloat msgLabelH = [_msgLabel.text heightForWidth:_customerName.height Font:TEXTFONT];
    _msgLabel.frame = CGRectMake((_customerName.width-msgLabelW)*0.5, (_customerName.height-msgLabelH)*0.5, msgLabelW, msgLabelH);
    
    _saveButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.78, _customerName.bottom + XMargin, 60.f, 44.f);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
