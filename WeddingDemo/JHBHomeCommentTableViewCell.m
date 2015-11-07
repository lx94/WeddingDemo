//
//  JHBHomeCommentTableViewCell.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/5.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomeCommentTableViewCell.h"
#import "JHBHomeCommentView.h"
#import "JHBHomeCommentFrame.h"
@implementation JHBHomeCommentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setCommentFrame:(JHBHomeCommentFrame *)commentFrame{
    _commentFrame = commentFrame;
    JHBHomeCommentView * commentView = commentFrame.commentView;
    _commentnameLabel.text = commentView.commentname;
    _commentnameLabel.frame = commentFrame.commentnameFrame;
    
    _commenttimeLabel.text = commentView.commenttime;
    _commenttimeLabel.frame = commentFrame.commentnameFrame;
    
    _commentmessageLabel.text = commentView.commentmessage;
    _commentmessageLabel.frame = commentFrame.commentmessageFrame;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel * commentnameLabel = [[UILabel alloc]init];
        _commentnameLabel = commentnameLabel;
        [self.contentView addSubview:commentnameLabel];
        UILabel * commenttimeLabel = [[UILabel alloc]init];
        _commenttimeLabel = commenttimeLabel;
        [self.contentView addSubview:commenttimeLabel];
        UILabel * commentmessageLabel = [[UILabel alloc]init];
        _commentmessageLabel = commentmessageLabel;
        [self.contentView addSubview:commentmessageLabel];
    }
    return self;
}

@end
