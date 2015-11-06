//
//  JHBPlaning.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBPlaning.h"


@implementation JHBPlaning

@dynamic name;
@dynamic pic;
@dynamic text;

+(instancetype)planingTextModel:(NSDictionary *)dict
{
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    
    JHBPlaning *planing = [NSEntityDescription insertNewObjectForEntityForName:@"JHBPlaning" inManagedObjectContext:delegate.managedObjectContext];
    
    planing.name = [dict objectForKey:@"name"];
    planing.text = [dict objectForKey:@"text"];
    planing.pic = [dict objectForKey:@"pic"];
    //planing.isShow = NO;
    [delegate saveContext];
    
    return planing;
}

@end
