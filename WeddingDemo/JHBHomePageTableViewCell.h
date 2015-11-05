//
//  JHBHomePageTableViewCell.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/2.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHBHomeModel.h"
@interface JHBHomePageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *HomePic;
@property (weak, nonatomic) IBOutlet UILabel *HomeName;
@property (weak, nonatomic) IBOutlet UILabel *HomeDes;
@property (weak, nonatomic) IBOutlet UILabel *HomeCount;

@property (strong,nonatomic)JHBHomeModel * homeModel;
@end
