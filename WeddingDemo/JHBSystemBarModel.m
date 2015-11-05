//
//  JHBSystemBarModel.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/2.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBSystemBarModel.h"

@implementation JHBSystemBarModel

+(instancetype)systemBarModelWithDict:(NSDictionary *)dict{
    JHBSystemBarModel *model = [[JHBSystemBarModel alloc]init];
    if (model) {
        model.essayTitle = [dict objectForKey:@"essayTitle"];
        model.authorName = [dict objectForKey:@"authorName"];
        model.essay = [dict objectForKey:@"essay"];
        model.icon=[dict objectForKey:@"image"];
    }
    return model;
}

@end
