//
//  JHBHomeView.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface JHBHomeView : NSObject
@property (copy,nonatomic) NSString * messagename;//信息
@property (copy,nonatomic) NSString * dress;//地址
@property (copy,nonatomic) NSString * phone;//联系方式
@property (copy,nonatomic) NSString * intro;//简介
@property (copy,nonatomic) NSString * pic;//图片
@property (copy,nonatomic) NSString *purpose;//宗旨
@property (copy,nonatomic) NSString *saveCount;//收藏数
@property (strong,nonatomic) NSArray * comment;//论坛
-(instancetype)initWithDictionary:(NSDictionary *) dict;
+(instancetype)messageWithDictionary:(NSDictionary *)dict;
@end
