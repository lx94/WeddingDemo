//
//  JHBToolsSeatViewCell.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/6.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHBSeatFrameModel.h"

@interface JHBToolsSeatViewCell : UITableViewCell

@property (weak, nonatomic) UILabel *deskID;
@property (weak, nonatomic) UILabel *customerName;

@property (strong, nonatomic) JHBSeatFrameModel *frameModel;

+(instancetype)seatTableViewCellWithTableView:(UITableView *)tableView;

@end
