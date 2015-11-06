//
//  JHBSeat.m
//  
//
//  Created by neuedu on 15/11/5.
//
//

#import "JHBSeat.h"


@implementation JHBSeat

@dynamic customerName;
@dynamic deskID;

+(instancetype)seatMsgModelWithDict:(NSDictionary *)dict
{
    AppDelegate *delegate=[UIApplication sharedApplication].delegate;
    JHBSeat *model=[NSEntityDescription insertNewObjectForEntityForName:@"JHBSeat" inManagedObjectContext:delegate.managedObjectContext];
    
    model.deskID = [dict objectForKey:@"deskID"];
    model.customerName = [dict objectForKey:@"customerName"];
    
    [delegate saveContext];
    
    return model;
}

@end
