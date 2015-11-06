//
//  JHBStoryFrameModel.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/5.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBStoryFrameModel.h"

@implementation JHBStoryFrameModel

+(instancetype)stroyFrameModel:(JHBStory *)msgModel
{
    JHBStoryFrameModel *msgFrameModel=[[JHBStoryFrameModel alloc]init];
    
    if (msgFrameModel)
    {
        [msgFrameModel initWithmsgModel:msgModel];
    }
    return msgFrameModel;
}
-(void)initWithmsgModel:(JHBStory *)msgModel
{
    _msgModel = msgModel;
    _nameFrame=CGRectMake(kMargin, kMargin, [UIScreen mainScreen].bounds.size.width-kMargin,30.f);
    CGFloat textFrameW=[msgModel.text widthForWidth:[UIScreen mainScreen].bounds.size.width Font:TEXTFONT];
    CGFloat textFrameH=[msgModel.text heightForWidth:textFrameW Font:TEXTFONT];
    _textFrame=CGRectMake(_nameFrame.origin.x, CGRectGetMaxY(_nameFrame), textFrameW, textFrameH);
}
-(CGFloat)cellHeight
{
    return CGRectGetMaxY(_textFrame)+kMargin;
}

@end
