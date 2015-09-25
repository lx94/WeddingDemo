//
//  JHBHomePageTableViewCell.h
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHBHomePageDataModel;
@interface JHBHomePageTableViewCell : UITableViewCell
+(instancetype)homePageTableViewCellWithTableView : (UITableView *) tableView;
@property (strong, nonatomic) JHBHomePageDataModel * groupPurchase;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;
@end
