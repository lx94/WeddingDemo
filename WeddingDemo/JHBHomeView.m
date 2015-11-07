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
        _messagename = dict[@"messagename"];
        _dress = dict[@"dress"];
        _pic = dict[@"pic"];
        _intro = dict[@"intro"];
        _phone = dict[@"phone"];
//        [self setValuesForKeysWithDictionary:dict];
//        NSMutableArray * tempDataArray = [NSMutableArray array];
//        for (int i = 0; i < _comment.count; i++) {
//            JHBHomeCommentView * commentView = [JHBHomeCommentView
//                                        commentWithDictionary:_comment[i]];
//            [tempDataArray addObject:commentView];
//        }
//        _comment= tempDataArray;
        
    }
    return self;
    
}
+(instancetype)messageWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
    
    
    
}
@end
