//
//  JHBPlaning.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface JHBPlaning : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * pic;
@property (nonatomic, retain) NSString * text;

+(instancetype)planingTextModel:(NSDictionary *)dict;

@end
