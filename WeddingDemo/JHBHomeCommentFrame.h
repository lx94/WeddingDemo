//
//  JHBHomeCommentFrame.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/5.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class JHBHomeCommentView;
@interface JHBHomeCommentFrame : NSObject
@property (assign,nonatomic) CGRect commentnameFrame;
@property (assign,nonatomic) CGRect commenttimeFrame;
@property (assign,nonatomic) CGRect commentmessageFrame;
@property (assign,nonatomic) CGFloat height;
@property (strong,nonatomic) JHBHomeCommentView * commentView;
@end
