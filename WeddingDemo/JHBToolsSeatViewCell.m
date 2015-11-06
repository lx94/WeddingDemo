//
//  JHBToolsSeatViewCell.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/6.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsSeatViewCell.h"

@implementation JHBToolsSeatViewCell

static NSString *cellID = @"seatListcell";
+(instancetype)seatTableViewCellWithTableView:(UITableView *)tableView
{
    JHBToolsSeatViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[JHBToolsSeatViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textColor = [UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *deskID = [[UILabel alloc]init];
        _deskID = deskID;
        deskID.font = IDFONT;
        deskID.numberOfLines = 0;
        deskID.textColor=[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1];
        [self addSubview:deskID];
        
        UILabel *customerName = [[UILabel alloc]init];
        _customerName = customerName;
        customerName.numberOfLines = 0;
        customerName.font = CUSNAMEFONT;
        customerName.textColor=[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1];
        [self addSubview:customerName];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _deskID.frame = _frameModel.deskIDFrame;
    _customerName.frame = _frameModel.customerNameFrame;
}

-(void)setFrameModel:(JHBSeatFrameModel *)frameModel
{
    _frameModel = frameModel;
    JHBSeat *msgModel = frameModel.msgModel;
    _deskID.text = msgModel.deskID;
    _customerName.text=msgModel.customerName;
}


@end
