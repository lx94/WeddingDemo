//
//  JHBHomeModel.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomeModel.h"

@implementation JHBHomeModel

+(instancetype)homePageWithDict:(NSDictionary *)dict{
    JHBHomeModel *homeModel = [[JHBHomeModel alloc]init];
    if (homeModel) {
        homeModel.pic = [dict objectForKey:@"pic"];
        homeModel.name = [dict objectForKey:@"name"];
        homeModel.des = [dict objectForKey:@"des"];
        homeModel.count = [dict objectForKey:@"count"];

    }
    
    
    //[delegate saveContext];
    
    return homeModel;
}

@end
