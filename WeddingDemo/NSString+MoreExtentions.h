//
//  NSString+MoreExtentions.h
//  UI2-微博
//
//  Created by hegf on 15/8/24.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (MoreExtentions)

//能够返回字符串暂用的高度，需要输入文字摆放的size 以及文字的字体
-(CGFloat)heightForWidth:(CGFloat)width Font:(UIFont*)font;

-(CGFloat)widthForWidth:(CGFloat)width Font:(UIFont*)font;

@end
