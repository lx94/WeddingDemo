//
//  JHBHome.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/2.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHome.h"
#import "AppDelegate.h"

@implementation JHBHome

@dynamic pic;
@dynamic name;
@dynamic des;
@dynamic count;

+(instancetype)homePageWithDict:(NSDictionary *)dict{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    JHBHome *homeModel = [NSEntityDescription insertNewObjectForEntityForName:@"JHBHome" inManagedObjectContext:delegate.managedObjectContext];
    
    homeModel.pic = [dict objectForKey:@"pic"];
    homeModel.name = [dict objectForKey:@"name"];
    homeModel.des = [dict objectForKey:@"des"];
    homeModel.count = [dict objectForKey:@"count"];
    
    //[delegate saveContext];
    
    return homeModel;
}
@end
