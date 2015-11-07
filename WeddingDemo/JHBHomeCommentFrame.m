//
//  JHBHomeCommentFrame.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/5.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomeCommentFrame.h"
#import "JHBHomeCommentView.h"
#import "NSString+MoreExtentions.h"
#define leftPadding 10
#define centerPadding 10
#define topPadding 10
#define kTextSize [UIFont systemFontOfSize:16.f]
@implementation JHBHomeCommentFrame
-(void)setCommentView:(JHBHomeCommentView *)commentView{
    _commentView = commentView;
    float X;
    float Y;
    float width;
    float height;
    
    X = leftPadding;
    Y = topPadding;
    width = [UIScreen mainScreen].bounds.size.width;
    height = 20;
    _commentnameFrame = CGRectMake(X, Y, width, height);
    
    X = leftPadding;
    Y = CGRectGetMaxY(_commentnameFrame) + centerPadding;
    width = [UIScreen mainScreen].bounds.size.width;
    height = [_commentView.commenttime heightForWidth:width Font:kTextSize];
    _commenttimeFrame = CGRectMake(X, Y, width, height);
    
    X = leftPadding;
    Y = CGRectGetMaxY(_commenttimeFrame) + centerPadding;
    width = [UIScreen mainScreen].bounds.size.width;
    height = [_commentView.commentmessage heightForWidth:width Font:kTextSize];
    _commentmessageFrame = CGRectMake(X, Y, width, height);


}
@end
