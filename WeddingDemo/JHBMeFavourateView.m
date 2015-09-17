//
//  JHBMeFavourateView.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBMeFavourateView.h"

@implementation JHBMeFavourateView


- (IBAction)LoveClickedButton:(UIButton *)sender
{
    sender.selected = !sender.selected;
   // [_LoveClikedButton setImage:[UIImage imageNamed:@"爱心1"] forState:UIControlStateSelected];
}
+(instancetype)LoveClicked
{
    JHBMeFavourateView*FavourateView=[[[NSBundle mainBundle]loadNibNamed:@"JHBMeFavourateView" owner:nil options:nil]lastObject];
    FavourateView.userInteractionEnabled= YES;
    
    return FavourateView;
}

@end
