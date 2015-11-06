//
//  JHBSeatFrameModel.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/6.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+MoreExtentions.h"
#import "JHBSeat.h"
#import "UIView+Extension.h"

#define HEIGHT 64.f
#define IDFONT [UIFont systemFontOfSize:20.f]
#define CUSNAMEFONT [UIFont systemFontOfSize:16.f]
#define kMargin 10.f

@interface JHBSeatFrameModel : NSObject

@property(assign, nonatomic)CGRect deskIDFrame;
@property(assign, nonatomic)CGRect customerNameFrame;
@property(strong, nonatomic)JHBSeat * msgModel;
@property(assign, nonatomic)BOOL stroll;
@property(assign, nonatomic)CGFloat cellHeight;

+(instancetype)seatFrameModel:(JHBSeat *)msgModel;

@end
