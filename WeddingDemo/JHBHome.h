//
//  JHBHome.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/2.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface JHBHome : NSManagedObject

@property (nonatomic, retain) NSString * pic;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * des;
@property (nonatomic, retain) NSString * count;

+(instancetype)homePageWithDict:(NSDictionary *)dict;

@end
