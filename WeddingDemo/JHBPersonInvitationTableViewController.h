//
//  JHBPersonInvitationTableViewController.h
//  WeddingDemo
//
//  Created by neuedu on 15/10/19.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHBPersonBarTableViewCell.h"

@interface JHBPersonInvitationTableViewController : UITableViewController<JHBPersonBarTableViewCellDelegate>

@property (copy,nonatomic) NSString *icon;
@property (copy,nonatomic) NSString *userName;
@end
