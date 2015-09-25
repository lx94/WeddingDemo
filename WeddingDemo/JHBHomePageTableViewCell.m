//
//  JHBHomePageTableViewCell.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomePageTableViewCell.h"
#import "JHBHomePageDataModel.h"
@implementation JHBHomePageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)homePageTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"tg";
    JHBHomePageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        UINib * nib = [UINib nibWithNibName:@"JHBHomePageTableViewCell" bundle:nil];
        cell = [[nib instantiateWithOwner:nil options:nil]lastObject];
        
        [tableView registerNib:nib forCellReuseIdentifier:ID];
    }
    return cell;
}
-(void)setGroupPurchase:(JHBHomePageDataModel *)groupPurchase
{
    _groupPurchase = groupPurchase;
    _imgView.image = [UIImage imageNamed:groupPurchase.icon];
    _titleLabel.text = groupPurchase.title;
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",groupPurchase.price];
    _buyCountLabel.text = [NSString stringWithFormat:@"已售%@",groupPurchase.buyCount];
}
@end
