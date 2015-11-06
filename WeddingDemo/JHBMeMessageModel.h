//
//  JHBMeMessageModel.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHBMeMessageModel : NSObject

@property(copy,nonatomic)NSString*name;
@property(copy,nonatomic)NSString*pic;
+(instancetype)JHBMessageModelWithDict:(NSDictionary*)dict;
@end
