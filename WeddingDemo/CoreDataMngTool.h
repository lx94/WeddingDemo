//
//  CoreDataMngTool.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/5.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "JHBSeat.h"
#import "JHBStory.h"

@interface CoreDataMngTool : NSObject

+(NSArray *)searchAllStroyLists;
+(NSArray *)searchAllSeatLists;
+(void)deleteAllMsg;
//+(instancetype)sharedCoreDataMngTool;

@end
