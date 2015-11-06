//
//  JHBSeatFrameModel.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/6.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBSeatFrameModel.h"

@implementation JHBSeatFrameModel

+(instancetype)seatFrameModel:(JHBSeat *)msgModel
{
    JHBSeatFrameModel *msgFrameModel=[[JHBSeatFrameModel alloc]init];
    
    if (msgFrameModel)
    {
        [msgFrameModel initWithmsgModel:msgModel];
    }
    return msgFrameModel;
}
-(void)initWithmsgModel:(JHBSeat *)msgModel
{
    _msgModel = msgModel;
    
    CGFloat deskIDFrameW=[msgModel.customerName widthForWidth:[UIScreen mainScreen].bounds.size.width-4*kMargin Font:IDFONT];
    CGFloat deskIDFrameH=[msgModel.customerName heightForWidth:deskIDFrameW Font:IDFONT];
    _deskIDFrame=CGRectMake(2*kMargin, kMargin, deskIDFrameW,deskIDFrameH);
    
    CGFloat cusNameFrameW=[msgModel.customerName widthForWidth:[UIScreen mainScreen].bounds.size.width-4*kMargin Font:CUSNAMEFONT];
    CGFloat cusNameFrameH=[msgModel.customerName heightForWidth:cusNameFrameW Font:CUSNAMEFONT];
    _customerNameFrame=CGRectMake(_deskIDFrame.origin.x, CGRectGetMaxY(_deskIDFrame)+2*kMargin, cusNameFrameW, cusNameFrameH);
}
-(CGFloat)cellHeight
{
    return CGRectGetMaxY(_customerNameFrame)+kMargin;
}


@end
