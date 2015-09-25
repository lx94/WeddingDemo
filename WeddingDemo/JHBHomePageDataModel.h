//
//  JHBHomePageDataModel.h
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHBHomePageDataModel : NSObject
@property (copy, nonatomic) NSString * buyCount;
@property (copy, nonatomic) NSString * icon;
@property (copy, nonatomic) NSString * price;
@property (copy, nonatomic) NSString * title;
-(instancetype)initWithDictionary : (NSDictionary *) dict;
+(instancetype)groupPurchaseWithDictionary : (NSDictionary *) dict;
@end
