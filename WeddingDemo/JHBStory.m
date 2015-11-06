//
//  JHBStory.m
//  
//
//  Created by neuedu on 15/11/5.
//
//

#import "JHBStory.h"


@implementation JHBStory

@dynamic name;
@dynamic text;

+(instancetype)storyMsgModelWithDict:(NSDictionary *)dict
{
    AppDelegate *delegate=[UIApplication sharedApplication].delegate;
    JHBStory *model=[NSEntityDescription insertNewObjectForEntityForName:@"JHBStory" inManagedObjectContext:delegate.managedObjectContext];
    
    model.name=[dict objectForKey:@"name"];
    model.text=[dict objectForKey:@"text"];

    [delegate saveContext];
    
    return model;
}

@end
