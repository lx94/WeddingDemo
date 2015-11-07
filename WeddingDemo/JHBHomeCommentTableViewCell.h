//
//  JHBHomeCommentTableViewCell.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/5.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHBHomeCommentFrame;
@interface JHBHomeCommentTableViewCell : UITableViewCell
@property (weak,nonatomic) UILabel * commentnameLabel;
@property (weak,nonatomic) UILabel * commenttimeLabel;
@property (weak,nonatomic) UILabel * commentmessageLabel;
@property (strong,nonatomic) JHBHomeCommentFrame * commentFrame;
@end
