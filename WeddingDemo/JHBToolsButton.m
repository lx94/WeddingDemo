//
//  JHBToolsButton.m
//  WeddingDemo
//
//  Created by neuedu on 15/10/14.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsButton.h"

@implementation JHBToolsButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat newRectX = (CGRectGetWidth(contentRect)-35.f)*0.5;
    CGFloat newRectY = (CGRectGetHeight(contentRect)-35.f)*0.5-15.f;
    CGRect newRect = CGRectMake(newRectX, newRectY, 35.f, 35.f);
    return newRect;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect titleRect = [super titleRectForContentRect:contentRect];
    CGFloat newRectY = (CGRectGetHeight(contentRect)-40.f-CGRectGetHeight(titleRect))*0.5+40.f;
    CGRect newRect = CGRectMake(0, newRectY, [UIScreen mainScreen].bounds.size.width/ROWNUM, CGRectGetHeight(titleRect));
    return newRect;
}

@end
