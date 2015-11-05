//
//  JHBPersonModel.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBPersonModel.h"
#import "NSString+DateTransform.h"

@implementation JHBPersonModel

+(instancetype)personBarModelWithDict:(PFObject *)dict{
    JHBPersonModel *personModel = [[JHBPersonModel alloc]init];
    if (personModel) {
        personModel.icon = ((PFFile *)dict[@"icon"]).url;
        personModel.name = dict[@"name"];
        personModel.text = dict[@"text"];
        //personModel.time = [dict objectForKey:@"time"];
        personModel.count = dict[@"count"];
        personModel.pic = ((PFFile *)dict[@"pic"]).url;;
        
        NSDate *date = dict.createdAt;
        personModel.time = [NSString YMDHMWithDate:date];
    }
     
    return personModel;
}

@end
