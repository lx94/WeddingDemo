//
//  JHBHomeView.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomeView.h"
#import "JHBHomeCommentView.h"
@implementation JHBHomeView
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        _messagename = dict[@"storeName"];
        _dress = dict[@"storeDress"];
        _pic = dict[@"pic"];
        _intro = dict[@"storeDes"];
        _phone = dict[@"storePhone"];
        _purpose = dict[@"storePurpose"];
        _saveCount = dict[@"saveCount"];
        _pic = ((PFFile *)dict[@"storePic"]).url;

        
    }
    return self;
    
}
+(instancetype)messageWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
    
    
    
}
@end
