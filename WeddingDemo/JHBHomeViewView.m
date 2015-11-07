//
//  JHBHomeViewView.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomeViewView.h"
#import "JHBHomeView.h"
#import "NSString+MoreExtentions.h"

#define kTextSize [UIFont systemFontOfSize:16.f]
#define leftPadding 10
#define topPadding 10
#define centerPadding 10


@implementation JHBHomeViewView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)JHBHomeViewView{
    JHBHomeViewView * viewview = [[JHBHomeViewView alloc]init];
    return viewview;
}
-(instancetype)init{
    self=[super init];
    UIImageView * picImgView = [[UIImageView alloc]init];
    _picImgView = picImgView;
    [self addSubview:picImgView];
    UILabel * messagenameLabel = [[UILabel alloc]init];
    _messagenameLabel = messagenameLabel;
    messagenameLabel.numberOfLines = 0;
    [self addSubview:messagenameLabel];
    UILabel * phoneLabel = [[UILabel alloc]init];
    _phoneLabel = phoneLabel;
    [self addSubview:phoneLabel];
    UILabel * dressLabel = [[UILabel alloc]init];
    _dressLabel = dressLabel;
    //_dressLabel.backgroundColor=[UIColor redColor];
    [self addSubview:dressLabel];
    UILabel * introLabel = [[UILabel alloc]init];
    _introLabel = introLabel;
    introLabel.numberOfLines=0;
    [self addSubview:introLabel];
    
    UIButton * commentButton = [[UIButton alloc]init];
    _commentButton = commentButton;
    
    [commentButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [commentButton setTitle:@"更多信息" forState:UIControlStateNormal];
    [commentButton setTitle:@"信息" forState:UIControlStateHighlighted];
    commentButton.backgroundColor = [UIColor blueColor];
    [self addSubview:commentButton];
    
    NSLog(@"num is %zi",self.subviews.count);
    
    return self;
}
-(void)btnClick:(UIButton *)btn{
    NSLog(@"1234");
    if ([self.delegate respondsToSelector:@selector(ViewView:btnClick:)]) {
        [self.delegate ViewView:self btnClick:btn];
    }
}
-(void)layoutSubviews{
    
    float X;
    float Y;
    float width;
    float height;
    
    //图片尺寸
    
    width = [UIScreen mainScreen].bounds.size.width;
    height = 150;
    _picImgView.frame = CGRectMake(0, 0, width, height);
    
    //名字尺寸
    X = leftPadding;
    Y = CGRectGetMaxY(_picImgView.frame) + topPadding;
    //width = 100;
    CGFloat frameW = [UIScreen mainScreen].bounds.size.width;
    CGFloat frameH = [_message.messagename heightForWidth:[UIScreen mainScreen].bounds.size.width Font:kTextSize] + topPadding;
//    CGRect rect = [_message.messagename boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13], nil] context:nil];
   
    _messagenameLabel.frame = CGRectMake(X, Y, frameW, frameH);
    
    //地址尺寸
    X = leftPadding;
    Y = CGRectGetMaxY(_messagenameLabel.frame) + centerPadding;
    width = [UIScreen mainScreen].bounds.size.width;
    height = [_message.dress heightForWidth:width Font:kTextSize];
    _dressLabel.frame = CGRectMake(X, Y, width, height);
    
    //简介尺寸
    X = leftPadding;
    Y = CGRectGetMaxY(_dressLabel.frame) + centerPadding;
//    width =  [_message.intro widthForWidth:[UIScreen mainScreen].bounds.size.width Font:kTextSize];
//    height = [_message.intro heightForWidth:[UIScreen mainScreen].bounds.size.width Font:kTextSize];
    
    _introLabel.frame = CGRectMake(X, Y, 360, 200);
    
    //联系方式尺寸
    X = leftPadding;
    Y = CGRectGetMaxY(_introLabel.frame) + centerPadding;
    _phoneLabel.frame = CGRectMake(X, Y, [UIScreen mainScreen].bounds.size.width, 44.f);
    
    //论坛尺寸
        X = topPadding;
    Y = CGRectGetMaxY(_phoneLabel.frame) + centerPadding;
    _commentButton.frame = CGRectMake(0, Y, [UIScreen mainScreen].bounds.size.width, 44.f);
//    X = topPadding;
//    Y = CGRectGetMaxY(_phoneLabel.frame) + centerPadding;
//    _commentLabel.frame = CGRectMake(X, Y, [UIScreen mainScreen].bounds.size.width, 44.f);
    
 
}

-(void)setMessage:(JHBHomeView *)message{
    _message=message;
    _picImgView.image = [UIImage imageNamed:message.pic];
    _messagenameLabel.text = message.messagename;
    _phoneLabel.text = message.phone;
    _introLabel.text = message.intro;
    _dressLabel.text = message.dress;
}
@end
