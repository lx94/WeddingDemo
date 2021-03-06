//
//  JHBPersonBarTableViewCell.h
//  WeddingDemo
//
//  Created by neuedu on 15/10/13.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHBPersonBarTableViewCell;
@protocol  JHBPersonBarTableViewCellDelegate<NSObject>

@optional
-(void)personBarTableViewCell:(JHBPersonBarTableViewCell *)cell ;

@end

#import "JHBPersonFrameModel.h"

@interface JHBPersonBarTableViewCell : UITableViewCell
//头像
@property (weak,nonatomic)UIImageView *icon;
//名字
@property (weak,nonatomic)UILabel *name;
//正文
@property (weak,nonatomic)UILabel *text;
//图片
//@property (weak,nonatomic)NSMutableArray *pics;
@property (weak,nonatomic)UIImageView *pic;
//发布的时间
@property (weak,nonatomic)UILabel *time;
//点赞
@property (weak,nonatomic)UIButton *comment;
//喜欢
@property (weak,nonatomic)UIButton *like;
@property (weak,nonatomic)UILabel *count;

@property (weak,nonatomic)UIImageView *imageUpView;



@property (strong,nonatomic)JHBPersonFrameModel *personFrameModel;
@property (weak,nonatomic) id <JHBPersonBarTableViewCellDelegate>delegate;

@end
