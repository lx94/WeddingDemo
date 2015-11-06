//
//  JHBMeUserNameView.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHBMeUserNameView;

@protocol JHBMeUserNameViewDelegate <NSObject,UIActionSheetDelegate>

@optional
-(void)JHBMeUserNameViewDidSaveListConfirm:(JHBMeUserNameView*)saveList;
-(void)JHBMeUserNameViewDidSaveListConfirm1:(JHBMeUserNameView*)saveList;
@end

@interface JHBMeUserNameView : UIView
+(instancetype)JHBMeUserNameView;
@property(weak,nonatomic)UITextField*saveListName;
@property(weak,nonatomic)UIButton*cancleButton;
@property(weak,nonatomic)UIButton*okButton;
@property(weak,nonatomic)id<JHBMeUserNameViewDelegate>delegate;
@property(weak,nonatomic)UIView*mengBoard;
-(void)showInView:(UIView*)view;
-(void)hidden;

@end
