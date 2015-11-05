//
//  JHBPersonFrameModel.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JHBPersonModel.h"

/*
 @property (nonatomic, retain) NSString * icon;
 @property (nonatomic, retain) NSString * name;
 @property (nonatomic, retain) NSString * text;
 @property (nonatomic, retain) NSString * pic;
 @property (nonatomic, retain) NSString * time;
 @property (nonatomic, retain) NSString * count;
 */
@interface JHBPersonFrameModel : NSObject
@property (strong,nonatomic) JHBPersonModel *personModel;

//子控件
@property (assign,nonatomic) CGRect iconFrame;
@property (assign,nonatomic) CGRect nameFrame;
@property (assign,nonatomic) CGRect textFrame;
@property (assign,nonatomic) CGRect picFrame;
@property (assign,nonatomic) CGRect timeFrame;
@property (assign,nonatomic) CGRect countFrame;

//cell高度
@property (assign,nonatomic) CGFloat cellHeight;
//定义一个类方法返回模型
+(instancetype)personFrameModelWithPersonModel:(JHBPersonModel *)model;
@end
