//
//  JHBPersonModel.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface JHBPersonModel : NSObject

@property (nonatomic, copy) NSString * icon;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * text;
@property (nonatomic, copy) NSString * pic;
@property (nonatomic, copy) NSString * time;
@property (nonatomic, copy) NSString * count;

+(instancetype)personBarModelWithDict:(PFObject *)dict;


@end
