//
//  JHBPersonBarMessageModel.h
//  WeddingDemo
//
//  Created by neuedu on 15/10/20.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHBPersonBarMessageModel : NSObject

//头像
@property (copy,nonatomic)NSString *iconPath;
//名字
@property (copy,nonatomic)NSString *name;
//正文
@property (copy,nonatomic)NSString *text;
//图片
@property (copy,nonatomic)NSString *picsPath;
//发布的时间
@property (copy,nonatomic)NSString *time;
//点赞数
@property (copy,nonatomic)NSString *count;


+(instancetype)personBarMessageModelWithDict:(NSDictionary *)dict;
@end
