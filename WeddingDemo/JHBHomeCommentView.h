//
//  JHBHomeCommentView.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHBHomeCommentView : NSObject
@property (copy,nonatomic) NSString * commentname;//姓名
@property (copy,nonatomic) NSString * commenttime;//时间
@property (copy,nonatomic) NSString * commentmessage;//帖子
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)commentWithDictionary:(NSDictionary *)dict;
@end
