//
//  JHBMeMessageModel.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBMeMessageModel.h"

@implementation JHBMeMessageModel

+(instancetype)JHBMessageModelWithDict:(NSDictionary *)dict
{
    JHBMeMessageModel*msg=[[JHBMeMessageModel alloc]init];
    if (msg) {
        msg.name=[dict objectForKey:@"name"];
        msg.pic=[dict objectForKey:@"pic"];
    }
    return msg;

}
@end
