//
//  JHBToolsStoryViewCell.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/5.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHBStoryFrameModel.h"

@interface JHBToolsStoryViewCell : UITableViewCell

@property (weak, nonatomic) UILabel *name;
@property (weak, nonatomic) UILabel *text;

@property (strong, nonatomic) JHBStoryFrameModel *frameModel;

+(instancetype)storyTableViewCellWithTableView:(UITableView *)tableView;

@end
