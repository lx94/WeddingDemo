//
//  JHBHomePageTableViewCell.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/2.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomePageTableViewCell.h"

@implementation JHBHomePageTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setHomeModel:(JHBHomeModel *)homeModel{
    _homeModel = homeModel;
    
    [_HomePic setImage:[UIImage imageNamed:homeModel.pic]];
    
    _HomeName.text = homeModel.name;
    
    _HomeDes.text = homeModel.des;
    
    _HomeCount.text = homeModel.count;
    
    
}
@end
