//
//  CoreDataMngTool.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/5.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "CoreDataMngTool.h"

@implementation CoreDataMngTool

+(NSArray *)searchAllStroyLists
{
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"JHBStory" inManagedObjectContext:delegate.managedObjectContext];
    request.entity = desc;
    
//    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"time" ascending:NO];
//    request.sortDescriptors = [NSArray arrayWithObject:sort];
    
    NSError *error = nil;
    NSArray *objs = [delegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error)
    {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    return objs;
}

+(NSArray *)searchAllSeatLists
{
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"JHBSeat" inManagedObjectContext:delegate.managedObjectContext];
    request.entity = desc;
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"deskID" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sort];
    
    NSError *error = nil;
    NSArray *objs = [delegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error)
    {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    return objs;
}

+(void)deleteMsg:(JHBStory *)contact
{
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    [delegate.managedObjectContext deleteObject:contact];
    
    NSError *error = nil;
    [delegate.managedObjectContext save:&error];
    if (error)
    {
        [NSException raise:@"删除错误" format:@"%@", [error localizedDescription]];
    }
}

+(void)deleteAllMsg
{
    AppDelegate *delegate=[UIApplication sharedApplication].delegate;
    NSArray * msgs=[CoreDataMngTool searchAllStroyLists];
    
    for (int i=0; i<msgs.count; i++)
    {
        [CoreDataMngTool deleteMsg:msgs[i]];
    }
    NSError *error = nil;
    [delegate.managedObjectContext save:&error];
    if (error)
    {
        [NSException raise:@"删除错误" format:@"%@", [error localizedDescription]];
    }
}
@end
