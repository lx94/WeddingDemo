//
//  JHBHomeHeaderView.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHBAdPageView.h"

@interface JHBHomeHeaderView : UIView

+(instancetype)homeHeaderView;

//横线
@property (weak,nonatomic) UILabel *ledgement;
//竖线
@property (weak,nonatomic) UILabel *verticalLine;
//按钮1
@property (weak,nonatomic) UIButton *buttonOne;
//按钮2
@property (weak,nonatomic) UIButton *buttonTwo;
//按钮3
@property (weak,nonatomic) UIButton *buttonThree;
//按钮4
@property (weak,nonatomic) UIButton *buttonFour;
//轮播view
@property (weak,nonatomic) JHBAdPageView *pageView;
//间隔
@property (weak,nonatomic) UILabel *midLcbel;

@end
