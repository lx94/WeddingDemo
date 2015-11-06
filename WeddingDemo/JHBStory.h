//
//  JHBStory.h
//  
//
//  Created by neuedu on 15/11/5.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface JHBStory : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * text;

+(instancetype)storyMsgModelWithDict:(NSDictionary *)dict;

@end
