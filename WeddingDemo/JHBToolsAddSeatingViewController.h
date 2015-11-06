//
//  JHBToolsAddSeatingViewController.h
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>
#import "UIView+Extension.h"
#import <Parse/Parse.h>
#import "CoreDataMngTool.h"
#import "NSString+MoreExtentions.h"

@interface JHBToolsAddSeatingViewController : UIViewController

@property (weak, nonatomic) UITextField *deskID;
@property (weak, nonatomic) UITextView *customerName;
@property (weak, nonatomic) UILabel *msgLabel;
@property (weak, nonatomic) UIButton *saveButton;

@end
