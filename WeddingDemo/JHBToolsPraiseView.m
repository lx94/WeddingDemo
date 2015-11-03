//
//  JHBToolsPraiseView.m
//  WeddingDemo
//
//  Created by neuedu on 15/10/13.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsPraiseView.h"

@implementation JHBToolsPraiseView

+ (instancetype)toolsPraiseView
{
    JHBToolsPraiseView *praiseView = [[[NSBundle mainBundle] loadNibNamed:@"JHBToolsPraiseView" owner:nil options:nil] lastObject];
    return praiseView;
}

- (void)awakeFromNib
{
    _praiseLine.backgroundColor = [UIColor lightGrayColor];
    [_praiseLabel setTextColor:[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1]];
}

- (IBAction)praiseButtonClick:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(toolsPraiseViewDidPraiseButtonClicked:)])
    {
        [_delegate toolsPraiseViewDidPraiseButtonClicked:sender];
    }
}

@end
