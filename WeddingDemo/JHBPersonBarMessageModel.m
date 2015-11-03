//
//  JHBPersonBarMessageModel.m
//  WeddingDemo
//
//  Created by neuedu on 15/10/20.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBPersonBarMessageModel.h"

@implementation JHBPersonBarMessageModel

+(instancetype)personBarMessageModelWithDict:(NSDictionary *)dict{
    JHBPersonBarMessageModel *personBarModel = [[JHBPersonBarMessageModel alloc]init];
    if (personBarModel) {
        personBarModel.iconPath = [dict objectForKey:@"iconPath"];
        personBarModel.name = [dict objectForKey:@"name"];
        personBarModel.text = [dict objectForKey:@"text"];
        personBarModel.picsPath = [dict objectForKey:@"picsPath"];
        personBarModel.time = [dict objectForKey:@"time"];
        personBarModel.count = [dict objectForKey:@"count"];
        
    }
    return personBarModel;
}
@end
