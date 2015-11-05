//
//  JHBSystemBarModel.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/2.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
@interface JHBSystemBarModel : NSObject

@property (copy,nonatomic) NSString *essayTitle;
@property (copy,nonatomic) NSString *authorName;
@property (copy,nonatomic) NSString *essay;
@property(strong,nonatomic)PFFile* icon;
+(instancetype)systemBarModelWithDict:(NSDictionary *)dict;

@end
