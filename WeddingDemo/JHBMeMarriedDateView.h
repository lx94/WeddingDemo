//
//  JHBMeMarriedDateView.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/5.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHBMeMarriedDateView;
@protocol JHBMeMarriedDateViewDelegate <NSObject>

@optional
-(void)JHBMeMarriedDateViewDidConfirm:(JHBMeMarriedDateView*)saveList;

@end
@interface JHBMeMarriedDateView : UIView

//@property(weak,nonatomic)UITextField*dateMarried;
@property(weak,nonatomic)UILabel*Label1;
@property(weak,nonatomic)UILabel*Label2;
@property(weak,nonatomic)UILabel*Label3;
@property(weak,nonatomic)UILabel*Label4;
@property(weak,nonatomic)UIButton*closeButton;
@property(weak,nonatomic)UIView*mengBoard;

@property(weak,nonatomic)UIView *DataMarried;
@property(weak,nonatomic)id<JHBMeMarriedDateViewDelegate>delegate;
+(instancetype)JHBMeMarriedDateView;
-(void)showInView1:(UIView*)view;
-(void)hidden1;
@end
