//
//  JHBHomePageSection1TableViewCell.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomePageSection0TableViewCell.h"
#import "UIView+Extension.h"

#define kSection0Padding 5.f
@interface JHBHomePageSection0TableViewCell ()
@property (weak, nonatomic) UIView * view;
@property (weak, nonatomic) UIView * hengXianView;
@property (weak, nonatomic) UIView * shuXianView;
@property (weak, nonatomic) UIButton * button0;
@property (weak, nonatomic) UIButton * button1;
@property (weak, nonatomic) UIButton * button2;
@property (weak, nonatomic) UIButton * button3;
@property (weak, nonatomic) UILabel * lable00;
@property (weak, nonatomic) UILabel * lable10;
@property (weak, nonatomic) UILabel * lable20;
@property (weak, nonatomic) UILabel * lable30;


@end
@implementation JHBHomePageSection0TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView * view = [[UIView alloc]init];
        _view = view;
        [self.contentView addSubview:view];
        
        UIView * hengXianView = [[UIView alloc]init];
        _hengXianView = hengXianView;
        [self.contentView addSubview:hengXianView];
        
        UIView * shuXianView = [[UIView alloc]init];
        _shuXianView = shuXianView;
        [self.contentView addSubview:shuXianView];
        //左上button
        UIButton * button0 = [[UIButton alloc]init];
        _button0 = button0;
        [self.contentView addSubview:button0];
        UILabel * lable00 = [[UILabel alloc]init];
        _lable00 = lable00;
        lable00.text = @"天天特价";
        lable00.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:lable00];
        //右上button
        UIButton * button1 = [[UIButton alloc]init];
        _button1 = button1;
        [self.contentView addSubview:button1];
        
        UILabel * lable10 = [[UILabel alloc]init];
        _lable10 = lable10;
        lable10.text = @"结婚拍摄";
        lable10.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:lable10];
        //左下button
        UIButton * button2 = [[UIButton alloc]init];
        _button2 = button2;
        [self.contentView addSubview:button2];
        
        UILabel * lable20 = [[UILabel alloc]init];
        _lable20 = lable20;
        lable20.text = @"备婚经验";
        lable20.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:lable20];
        //右下button
        UIButton * button3 = [[UIButton alloc]init];
        _button3 = button3;
        [self.contentView addSubview:button3];
        
        UILabel * lable30 = [[UILabel alloc]init];
        _lable30 = lable30;
        lable30.text = @"品质旅拍";
        lable30.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:lable30];
        
    }
    return self;
}

+(instancetype)homepageSection0TableViewCellWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"cell";
    JHBHomePageSection0TableViewCell * cell = [[JHBHomePageSection0TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];

    return cell;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 126);
    //_view.backgroundColor = [UIColor cyanColor];
    _hengXianView.frame = CGRectMake(0, _view.height/2, _view.width, 0.5);
    _hengXianView.backgroundColor = [UIColor grayColor];
    _shuXianView.frame = CGRectMake(_view.width/2, 0, 0.5, _view.height);
    _shuXianView.backgroundColor = [UIColor grayColor];
     //左上button
    _button0.frame = CGRectMake(0, 0, _view.width/2, _view.height/2);
    //_button0.backgroundColor = [UIColor blackColor];
    
    _lable00.frame = CGRectMake(kSection0Padding, kSection0Padding, _view.width/4, _view.height/4);
    //NSLog(@"lable00 is %@",NSStringFromCGRect(_lable00.frame));
    //右上button
    _button1.frame = CGRectMake(_view.width/2, 0, _view.width/2, _view.height/2);
    //_button1.backgroundColor = [UIColor purpleColor];
    
    _lable10.frame = CGRectMake(_shuXianView.frame.origin.x+kSection0Padding, kSection0Padding, _view.width/4, _view.height/4);
    //NSLog(@"lable10 is %@",NSStringFromCGRect(_lable10.frame));
    //左下button
    _button2.frame = CGRectMake(0, _view.height/2, _view.width/2, _view.height/2);
    //_button2.backgroundColor = [UIColor cyanColor];
    
    _lable20.frame = CGRectMake(kSection0Padding, _hengXianView.frame.origin.y+kSection0Padding, _view.width/4, _view.height/4);
    //右下button
    _button3.frame = CGRectMake(_view.width/2, _view.height/2, _view.width/2, _view.height/2);
    //_button3.backgroundColor = [UIColor blueColor];
    
    _lable30.frame = CGRectMake(_lable10.frame.origin.x, _lable20.frame.origin.y, _view.width/4, _view.height/4);
    
}
@end
