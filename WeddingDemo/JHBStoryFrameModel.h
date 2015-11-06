//
//  JHBStoryFrameModel.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/5.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+MoreExtentions.h"
#import "JHBStory.h"
#import "UIView+Extension.h"

#define HEIGHT 64.f
#define NAMEFONT [UIFont systemFontOfSize:20.f]
#define TEXTFONT [UIFont systemFontOfSize:16.f]
#define kMargin 10.f

@interface JHBStoryFrameModel : NSObject

@property(assign, nonatomic)CGRect nameFrame;
@property(assign, nonatomic)CGRect textFrame;
@property(strong, nonatomic)JHBStory * msgModel;
@property(assign, nonatomic)BOOL stroll;
@property(assign, nonatomic)CGFloat cellHeight;

+(instancetype)stroyFrameModel:(JHBStory *)msgModel;

@end
