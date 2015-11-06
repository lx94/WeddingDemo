//
//  JHBMeUserNameView.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBMeUserNameView.h"
#define KGMargin 18.f
@implementation JHBMeUserNameView
+(instancetype)JHBMeUserNameView
{
    JHBMeUserNameView*saveList=[[JHBMeUserNameView alloc]init];
    saveList.bounds=CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width)*0.6,108.f);
    saveList.center=CGPointMake(([UIScreen mainScreen].bounds.size.width)*0.5, ([UIScreen mainScreen].bounds.size.height)*0.5);
    saveList.backgroundColor=[UIColor lightGrayColor];
    return saveList;
}
-(instancetype)init
{
    self=[super init];
    if (self) {
        UITextField*saveListName=[[UITextField alloc]init];
        _saveListName=saveListName;
        saveListName.backgroundColor=[UIColor whiteColor];
        //_saveListName.text=@"请输入用户名";
        _saveListName.placeholder=@"请输入用户名";
        [self addSubview:saveListName];
        
        
        
        UIButton*okButton=[[UIButton alloc]init];
        _okButton=okButton;
        //设置button的框框边框颜色
        okButton.layer.borderColor=(__bridge CGColorRef)([UIColor colorWithRed:210.f/255.f green:144.f/255.f blue:133.f/255.f alpha:1.0f]);
        //设置button的框框边框宽度
        okButton.layer.borderWidth=2.0f;
        //设置button的框框边框弧度
        okButton.layer.cornerRadius=15.f;
        [self addSubview:okButton];
        okButton.backgroundColor=[UIColor colorWithRed:210.f/255.f green:144.f/255.f blue:133.f/255.f alpha:1.0f];
        [okButton addTarget:self action:@selector(okButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [okButton setTitle:@"确定" forState:UIControlStateNormal];
        [okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [okButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        
        
        UIButton*cancleButton=[[UIButton alloc]init];
        _cancleButton=cancleButton;
        //设置button的框框边框颜色
        cancleButton.layer.borderColor=(__bridge CGColorRef)([UIColor colorWithRed:210.f/255.f green:144.f/255.f blue:133.f/255.f alpha:1.0f]);
        //设置button的框框边框宽度
        cancleButton.layer.borderWidth=2.0f;
        //设置button的框框边框弧度
        cancleButton.layer.cornerRadius=15.f;
        cancleButton.backgroundColor=[UIColor colorWithRed:210.f/255.f green:144.f/255.f blue:133.f/255.f alpha:1.0f];
        [self addSubview:cancleButton];
        [cancleButton addTarget:self action:@selector(cancleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [cancleButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _saveListName.frame=CGRectMake(KGMargin, KGMargin, 189.f, KGMargin);
    _okButton.frame=CGRectMake(KGMargin, 56.f, 85.f, KGMargin);
    _cancleButton.frame=CGRectMake(124.f, 56.f, 85.f, KGMargin);
    
}

-(void)okButtonClicked:(UIButton*)sender
{
    if ([_delegate respondsToSelector:@selector(JHBMeUserNameViewDidSaveListConfirm:)]) {
        [_delegate JHBMeUserNameViewDidSaveListConfirm:self];
    }

}
-(void)cancleButtonClicked:(UIButton*)sender
{
    if ([_delegate respondsToSelector:@selector(JHBMeUserNameViewDidSaveListConfirm1:)]) {
        [_delegate JHBMeUserNameViewDidSaveListConfirm1:self];
    }

}
#pragma mark蒙板显现
-(void)showInView:(UIView *)view
{
    //self就是saveListView
    UIView*mengBoard=[[UIView alloc]init];
    _mengBoard=mengBoard;
    mengBoard.frame=[UIScreen mainScreen].bounds;
    mengBoard.alpha=0.3f;
    mengBoard.backgroundColor=[UIColor blackColor];
    [view addSubview:mengBoard];
    [view addSubview:self];
}
#pragma mark蒙板消失
-(void)hidden
{
    [_mengBoard removeFromSuperview];
    [self removeFromSuperview];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
