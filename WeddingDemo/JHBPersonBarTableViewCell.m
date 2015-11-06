//
//  JHBPersonBarTableViewCell.m
//  WeddingDemo
//
//  Created by neuedu on 15/10/13.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBPersonBarTableViewCell.h"
#import "NSString+MoreExtentions.h"
#import <UIImageView+WebCache.h>


#define kMiddleMagin 2.f
#define kMagin 8.f
#define kBigFont [UIFont systemFontOfSize:16.f]
#define kSmallFont [UIFont systemFontOfSize:14.f]
#define kNameColor [UIColor colorWithRed:50.f/255.f green:175.f/255.f blue:246.f/255.f alpha:1.f]

@implementation JHBPersonBarTableViewCell

/*@property (weak,nonatomic)UIImageView *icon;
 //名字
 @property (weak,nonatomic)UILabel *name;
 //正文
 @property (weak,nonatomic)UILabel *text;
 //图片,最多9个，用数组保存
 @property (strong,nonatomic)NSMutableArray *pics;
 //发布的时间
 @property (weak,nonatomic)UILabel *time;
 //点赞评论
 @property (weak,nonatomic)UIButton *commentButton;
 */

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setViews];
    }
    return self;
}


- (void)setViews {
    // Initialization code
    //添加子控件
    
    UIImageView *icon = [[UIImageView alloc]init];
    _icon = icon;
    icon.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:icon];
    
    UILabel *name = [[UILabel alloc]init];
    _name = name;
    name.font = kBigFont;
    name.textColor = kNameColor;
    [self.contentView addSubview:name];
    
    UILabel *text = [[UILabel alloc]init];
    _text = text;
    text.numberOfLines = 0;
    text.font = kBigFont;
    text.textColor = [UIColor blackColor];
    [self.contentView addSubview:text];
    
    UIImageView *pic = [[UIImageView alloc]init];
    _pic = pic;
    [self.contentView addSubview:pic];

    //时间
    UILabel *time = [[UILabel alloc]init];
    _time = time;
    time.font = kSmallFont;
    time.textColor = [UIColor grayColor];
    [self.contentView addSubview:time];
    
    UIImageView *imageUpView = [[UIImageView alloc]init];
    _imageUpView = imageUpView;
    [imageUpView setImage:[UIImage imageNamed:@"pic_personBar_bac"]];
    imageUpView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:imageUpView];
    
    
    //点赞
    UIButton *comment = [[UIButton alloc]init];
    _comment = comment;
    [self.contentView addSubview:comment];
    [comment setBackgroundImage:[UIImage imageNamed:@"icon_personBar_r"] forState:UIControlStateNormal];
    [comment setBackgroundImage:[UIImage imageNamed:@"icon_personBar_h"] forState:UIControlStateHighlighted];
    [comment addTarget:self action:@selector(comment:) forControlEvents:UIControlEventTouchUpInside];
    //commentButton.imageView.contentMode = UIViewContentModeCenter;
    //喜欢
    UIButton *like = [[UIButton alloc]init];
    _like = like;
    [self.contentView addSubview:like];
    [like setBackgroundImage:[UIImage imageNamed:@"icon_personBar_l"] forState:UIControlStateNormal];

    UILabel *count = [[UILabel alloc]init];
    _count = count;
    count.text = @"1227";
    count.font = kSmallFont;
    [self.contentView addSubview:count];
    
}
//模型的setter方法，每次cell显示都会调用
-(void)layoutSubviews{
    [super layoutSubviews];
    _imageUpView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 3*kMagin);

    _icon.frame = self.personFrameModel.iconFrame;
    _icon.layer.cornerRadius = _icon.frame.size.width*0.5;
    _icon.layer.masksToBounds = YES;
    
    _name.frame = self.personFrameModel.nameFrame;
    _text.frame = self.personFrameModel.textFrame;
    //_pics.frame = self.personFrameModel.picFrame;
    
    _time.frame = self.personFrameModel.timeFrame;
    
    if (self.personFrameModel.personModel.pics.length ==0)
    {
        self.pic.frame=CGRectZero;
        _comment.frame = CGRectMake(CGRectGetMinX(_text.frame), CGRectGetMaxY(_text.frame)+kMagin, 20.f, 22.f);
        _like.frame = CGRectMake([UIScreen mainScreen].bounds.size.width -100.f, CGRectGetMinY(_comment.frame), 20.f, 22.f);
        _count.frame = self.personFrameModel.countFrame;

    }else{
        _pic.frame = self.personFrameModel.picFrame;
        _comment.frame = CGRectMake(CGRectGetMinX(_pic.frame), CGRectGetMaxY(_pic.frame)+kMagin, 20.f, 22.f);
        _like.frame = CGRectMake([UIScreen mainScreen].bounds.size.width -100.f, CGRectGetMinY(_comment.frame), 20.f, 22.f);
        _count.frame = self.personFrameModel.countFrame;
    }

    
    
}
#pragma mark 点赞评论点击事件
-(void)comment:(UIButton *)sender{
    NSLog(@"点赞");
    if ([self.delegate respondsToSelector:@selector(personBarTableViewCell:)]) {
        [self.delegate personBarTableViewCell:self];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


-(void)setPersonFrameModel:(JHBPersonFrameModel *)personFrameModel{
    _personFrameModel = personFrameModel;
    
    
    [self.icon sd_setImageWithURL:[NSURL URLWithString:personFrameModel.personModel.icon] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    if (personFrameModel.personModel.pics.length != 0) {
        [self.pic sd_setImageWithURL:[NSURL URLWithString:personFrameModel.personModel.pics]];
    }
    

    
    [self.name setText:personFrameModel.personModel.name];
    [self.text setText:personFrameModel.personModel.text];
    [self.time setText:personFrameModel.personModel.time];
    [self.count setText:personFrameModel.personModel.count];
}
@end
