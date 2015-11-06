//
//  JHBMeMarriedDateView.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/5.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBMeMarriedDateView.h"
#import "NSString+MoreExtentions.h"
#define KMargin 18.f
#define KUpMargin 10.f
@implementation JHBMeMarriedDateView

+(instancetype)JHBMeMarriedDateView
{
    JHBMeMarriedDateView*dateMarried=[[JHBMeMarriedDateView alloc]init];
    dateMarried.bounds=CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width)*0.6,[UIScreen mainScreen].bounds.size.height*1/6);
    dateMarried.center=CGPointMake(([UIScreen mainScreen].bounds.size.width)*0.5, ([UIScreen mainScreen].bounds.size.height)*0.5);
    dateMarried.backgroundColor=([UIColor colorWithRed:210.f/255.f green:144.f/255.f blue:133.f/255.f alpha:1.0f]);
    [dateMarried layoutSubviews];
    return dateMarried;
}
-(instancetype)init
{
    self=[super init];
    if (self) {
        UIView* view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        
        _DataMarried =view;
        view.layer.cornerRadius=15.f;
        view.backgroundColor =[UIColor blueColor];
        [self addSubview:view];
        
        
       
        UILabel*label1=[[UILabel alloc]init];
        _Label1=label1;
        label1.text=@"您的婚期是";
        label1.textColor=[UIColor whiteColor];
        [self addSubview:label1];
        
        
        UILabel*label2=[[UILabel alloc]init];
        _Label2=label2;
        label2.text=@"____";
        //label2.textAlignment=NSTextAlignmentCenter;
        label2.textColor=[UIColor whiteColor];
        [self addSubview:label2];
        
        UILabel*label3=[[UILabel alloc]init];
        _Label3=label3;
        label3.text=@"距离您的婚期还有__天";
        label3.textColor=[UIColor whiteColor];
        [self addSubview:label3];
        
//        UILabel*label4=[[UILabel alloc]init];
//        _Label4=label4;
//        label4.textColor=[UIColor whiteColor];
//        label4.text=@"__天";
//        [self addSubview:label4];

        
        UIButton*closeButton=[[UIButton alloc]init];
        _closeButton=closeButton;
        //设置button的框框边框颜色
        closeButton.layer.borderColor=(__bridge CGColorRef)([UIColor colorWithRed:210.f/255.f green:144.f/255.f blue:133.f/255.f alpha:1.0f]);
        //设置button的框框边框宽度
        closeButton.layer.borderWidth=2.0f;
        //设置button的框框边框弧度
        closeButton.layer.cornerRadius=15.f;
        [self addSubview:closeButton];
        closeButton.backgroundColor=[UIColor colorWithRed:210.f/255.f green:144.f/255.f blue:133.f/255.f alpha:1.0f];
        [closeButton addTarget:self action:@selector(okButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [closeButton setTitle:@"确定" forState:UIControlStateNormal];
        [closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [self layoutSubviews];
   }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
//    CGFloat label2Framex=[_Label2.text widthForWidth:([UIScreen mainScreen].bounds.size.width)  Font:[UIFont systemFontOfSize:10.f]];
    
    
//   _Label1.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width)*0.6/3,0,[UIScreen mainScreen].bounds.size.width-2*KMargin ,[UIScreen mainScreen].bounds.size.height*1/36);
    
    _Label1.frame =CGRectMake(KMargin, KMargin, [UIScreen mainScreen].bounds.size.width, 20);
    
    
    _Label2.frame =CGRectMake(CGRectGetMinX(_Label1.frame), CGRectGetMaxY(_Label1.frame), CGRectGetWidth(_Label1.frame), CGRectGetHeight(_Label1.frame));
    _Label3.frame =CGRectMake(CGRectGetMinX(_Label1.frame), CGRectGetMaxY(_Label2.frame), CGRectGetWidth(_Label2.frame), CGRectGetHeight(_Label2.frame));
//
//    _Label2.frame=CGRectMake((([UIScreen mainScreen].bounds.size.width)*0.6-label2Framex)/2,CGRectGetMaxY(_Label1.frame),label2Framex,[UIScreen mainScreen].bounds.size.height*1/36);
//
//
//    
//    _Label3.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-KMargin, [UIScreen mainScreen].bounds.size.width-2*KMargin+([UIScreen mainScreen].bounds.size.height-2*KUpMargin)/3,[UIScreen mainScreen].bounds.size.width-KMargin , ([UIScreen mainScreen].bounds.size.height-2*KUpMargin)/3);
//    _Label4.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-KMargin+[UIScreen mainScreen].bounds.size.width-KMargin, [UIScreen mainScreen].bounds.size.width-2*KMargin+([UIScreen mainScreen].bounds.size.height-2*KUpMargin)/3, KMargin, ([UIScreen mainScreen].bounds.size.height-2*KUpMargin)/3);
    
    
    
    
}

-(void)okButtonClicked
{

    if ([_delegate respondsToSelector:@selector(JHBMeMarriedDateViewDidConfirm:)]) {
        [_delegate JHBMeMarriedDateViewDidConfirm:self];
    }
}
#pragma mark蒙板显现
-(void)showInView1:(UIView *)view
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
-(void)hidden1
{
    [_mengBoard removeFromSuperview];
    [self removeFromSuperview];
    
    
}

@end
