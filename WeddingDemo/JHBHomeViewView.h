//
//  JHBHomeViewView.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHBHomeView;
@class JHBHomeViewView;
@protocol JHBHomeViewViewDelegate <NSObject>

@optional
-(void)ViewView:(JHBHomeViewView*)ViewView btnClick:(UIButton *)btn;

@end
@interface JHBHomeViewView : UIView
@property (weak,nonatomic) UIImageView * picImgView;
@property (weak,nonatomic) UILabel * messagenameLabel;
@property (weak,nonatomic) UILabel * dressLabel;
@property (weak,nonatomic) UILabel * introLabel;
@property (weak,nonatomic) UILabel * phoneLabel;

@property (weak,nonatomic) UIButton * commentButton;

@property (strong,nonatomic) JHBHomeView * message;
+(instancetype)JHBHomeViewView;
@property (weak,nonatomic) id<JHBHomeViewViewDelegate> delegate;
@end
