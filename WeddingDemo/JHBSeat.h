//
//  JHBSeat.h
//  
//
//  Created by neuedu on 15/11/5.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface JHBSeat : NSManagedObject

@property (nonatomic, retain) NSString * customerName;
@property (nonatomic, retain) NSString * deskID;

+(instancetype)seatMsgModelWithDict:(NSDictionary *)dict;

@end
