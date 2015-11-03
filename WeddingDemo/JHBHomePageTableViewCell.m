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
-(void)setHome:(JHBHome *)home{
    _home=home;
    
    [_HomePic setImage:[UIImage imageNamed:home.pic]];
    
    _HomeName.text = home.name;
    
    _HomeDes.text = home.des;
    
    _HomeCount.text = home.count;
    
    
}
@end
