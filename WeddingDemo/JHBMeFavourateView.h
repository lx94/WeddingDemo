//
//  JHBMeFavourateView.h
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JHBMeFavourateView : UIView
@property(assign,nonatomic)BOOL Value;
@property (weak, nonatomic) IBOutlet UIButton *LoveClikedButton;
- (IBAction)LoveClickedButton:(UIButton *)sender;

+(instancetype)LoveClicked;
@end
