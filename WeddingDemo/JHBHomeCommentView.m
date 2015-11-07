//
//  JHBHomeCommentView.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomeCommentView.h"

@implementation JHBHomeCommentView
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    
    if (self = [super init]) {
        //[self setValuesForKeysWithDictionary:dict];
                _commentname = dict[@"commentname"];
                _commenttime = dict[@"commenttime"];
                _commentmessage = dict[@"commengmessage"];
                
        
    }
    return self;
}


+(instancetype)commentWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}

@end
