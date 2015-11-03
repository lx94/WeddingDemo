//
//  JHBHomeHeaderView.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomeHeaderView.h"
#import "JHBAdPageView.h"
#import "UIView+Extension.h"

#define kPageViewHeight 120.f
#define kbuttonHeight 30.f
#define kMidMargin 10.f
#define textColor [UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1]

@implementation JHBHomeHeaderView

+(instancetype)homeHeaderView{
    JHBHomeHeaderView *headerView = [[JHBHomeHeaderView alloc]init];
    return headerView;
    
}
//添加子控件
-(instancetype)init{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        //创建横线
        UILabel *ledgement = [[UILabel alloc]init];
        _ledgement = ledgement;
        [ledgement setBackgroundColor:[UIColor grayColor]];
        [self addSubview:ledgement];
        
        //创建竖线
        UILabel *verticalLine = [[UILabel alloc]init];
        _verticalLine = verticalLine;
        [verticalLine setBackgroundColor:[UIColor grayColor]];
        [self addSubview:verticalLine];
        
        //创建按键1
        UIButton *buttonOne = [[UIButton alloc]init];
        _buttonOne = buttonOne;
        [buttonOne setTitle:@"婚礼策划" forState:UIControlStateNormal];
        [buttonOne setTitleColor:textColor forState:UIControlStateNormal];
        [buttonOne setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:buttonOne];
        
        //创建按键2
        UIButton *buttonTwo = [[UIButton alloc]init];
        _buttonTwo = buttonTwo;
        [buttonTwo setTitle:@"我的婚礼" forState:UIControlStateNormal];
        [buttonTwo setTitleColor:textColor forState:UIControlStateNormal];
        [buttonTwo setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:buttonTwo];
        
        //创建按键3
        UIButton *buttonThree = [[UIButton alloc]init];
        _buttonThree = buttonThree;
        [buttonThree setTitle:@"婚礼摄影" forState:UIControlStateNormal];
        [buttonThree setTitleColor:textColor forState:UIControlStateNormal];
        [buttonThree setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:buttonThree];
        
        //创建按键4
        UIButton *buttonFour = [[UIButton alloc]init];
        _buttonFour = buttonFour;
        [buttonFour setTitle:@"婚礼摄影" forState:UIControlStateNormal];
        [buttonFour setTitleColor:textColor forState:UIControlStateNormal];
        [buttonFour setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:buttonFour];
        
        //间隔
        UILabel *midLabel = [[UILabel alloc]init];
        _midLcbel = midLabel;
        [midLabel setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:midLabel];

        //轮播器
        JHBAdPageView *pageView = [[JHBAdPageView alloc]init];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"m1"]];
        imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kPageViewHeight);
        [pageView addSubview:imageView];
        _pageView = pageView;
        [self addSubview:pageView];

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    _pageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kPageViewHeight);
    _buttonOne.frame = CGRectMake(CGRectGetMinX(_pageView.frame), CGRectGetMaxY(_pageView.frame)+kMidMargin, [UIScreen mainScreen].bounds.size.width*0.5-1.f, kbuttonHeight);
    _buttonTwo.frame = CGRectMake(CGRectGetMaxX(_buttonOne.frame)+1.f, CGRectGetMinY(_buttonOne.frame), _buttonOne.frame.size.width, kbuttonHeight);
    _buttonThree.frame = CGRectMake(CGRectGetMinX(_buttonOne.frame), CGRectGetMaxY(_buttonOne.frame)+1.f, _buttonOne.frame.size.width, kbuttonHeight);
    _buttonFour.frame = CGRectMake(CGRectGetMaxX(_buttonOne.frame)+1.f, CGRectGetMaxY(_buttonOne.frame)+1.f, _buttonOne.frame.size.width, kbuttonHeight);
    _ledgement.frame = CGRectMake(CGRectGetMaxX(_buttonOne.frame), CGRectGetMinY(_buttonOne.frame), 1.f, 2*kbuttonHeight);
    _verticalLine.frame = CGRectMake(CGRectGetMinX(_buttonOne.frame), CGRectGetMaxY(_buttonOne.frame), [UIScreen mainScreen].bounds.size.width, 1.f);
    _midLcbel.frame = CGRectMake(CGRectGetMinX(_buttonOne.frame), CGRectGetMaxY(_buttonThree.frame)+0.5*kMidMargin, [UIScreen mainScreen].bounds.size.width, 0.5*kMidMargin);
    
}

@end
