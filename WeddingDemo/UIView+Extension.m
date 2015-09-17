//
//  UIView+Extension.m
//  UI01-QQ登录界面混合代码实现－150810
//
//  Created by hegf on 15/8/10.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
//getter方法
-(CGFloat)top{
   return self.frame.origin.y;
}

-(void)setTop:(CGFloat)top{
    //一个viewframe只能整体赋值，不能单独地改变某一个变量 比如self.frame.origin.y
    //如果要改变某一个值，需要采取以下方法
    CGRect tmpframe = self.frame;
    tmpframe.origin.y = top;
    self.frame = tmpframe;
}

-(CGFloat)bottom{
    return self.frame.origin.y+self.frame.size.height;
}

-(void)setBottom:(CGFloat)bottom{
    //如果要改变某一个值，需要采取以下方法
    CGRect tmpframe = self.frame;
    tmpframe.origin.y = bottom-self.frame.size.height;
    self.frame = tmpframe;
}

-(CGFloat)left{
    return self.frame.origin.x;
}

-(void)setLeft:(CGFloat)left{
    CGRect tmpframe = self.frame;
    tmpframe.origin.x = left;
    self.frame = tmpframe;
}

-(CGFloat)right{
    return self.frame.origin.x+self.frame.size.width;
}

-(void)setRight:(CGFloat)right{
    CGRect tmpframe = self.frame;
    tmpframe.origin.x = right-self.frame.size.width;
    self.frame = tmpframe;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(void)setWidth:(CGFloat)width{
    CGRect tmpframe = self.frame;
    tmpframe.size.width = width;
    self.frame = tmpframe;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height{
    CGRect tmpframe = self.frame;
    tmpframe.size.height= height;
    self.frame = tmpframe;
}

@end
