//
//  JHBToolsPlaningViewController.h
//  WeddingDemo
//
//  Created by neuedu on 15/9/25.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
#import "MBProgressHUD+MoreExtension.h"
#import "JHBPlaning.h"

#define HEIGHT 64.f
#define BUTTONCOUNT 6
#define COLUMNNUM 2
#define ROWNUM (BUTTONCOUNT/COLUMNNUM)
#define TOOLBUTTONWIDTH 200.f
#define TOOLBUTTONHEIGHT 45.f
#define BUTTONFONT [UIFont systemFontOfSize:18.f]
#define kMargin 10.f

@interface JHBToolsPlaningViewController : UIViewController

@property (copy, nonatomic) NSString *planName;
@property (weak, nonatomic) IBOutlet UIView *textView;
@property (weak, nonatomic) IBOutlet UIButton *returnButton;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *frontButton;
- (IBAction)returnButton:(UIButton *)sender;
- (IBAction)frontButton:(UIButton *)sender;
- (IBAction)nextButton:(UIButton *)sender;

@end
