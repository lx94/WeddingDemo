//
//  JHBToolsStoryViewCell.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/5.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsStoryViewCell.h"

@implementation JHBToolsStoryViewCell

+(instancetype)storyTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"storyListcell";
    JHBToolsStoryViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[JHBToolsStoryViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
        UILabel *name = [[UILabel alloc]init];
        _name = name;
        name.font = NAMEFONT;
        name.textColor=[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1];
        [self addSubview:name];
        
        UILabel *text = [[UILabel alloc]init];
        _text = text;
        text.font = TEXTFONT;
        text.textColor=[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1];
        [self addSubview:text];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _name.frame = _frameModel.nameFrame;
    _text.frame = _frameModel.textFrame;
}

-(void)setFrameModel:(JHBStoryFrameModel *)frameModel
{
    _frameModel = frameModel;
    JHBStory *msgModel = frameModel.msgModel;
    _name.text = msgModel.name;
    _text.text=msgModel.text;
}

@end
