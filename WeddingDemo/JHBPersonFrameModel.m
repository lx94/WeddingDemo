//
//  JHBPersonFrameModel.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/4.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBPersonFrameModel.h"
#import "NSString+MoreExtentions.h"

#define kMiddleMagin 2.f
#define kMagin 8.f

#define kBigFont [UIFont systemFontOfSize:16.f]
#define kSmallFont [UIFont systemFontOfSize:14.f]

@implementation JHBPersonFrameModel

+(instancetype)personFrameModelWithPersonModel:(JHBPersonModel *)model{
    JHBPersonFrameModel *personFrameModel = [[JHBPersonFrameModel alloc]init];
    if (personFrameModel) {
        [personFrameModel initWithPersonModel:model];
    }
    return personFrameModel;
}

-(void)initWithPersonModel:(JHBPersonModel *)personModel{
    _personModel = personModel;
    
    //头像frame
    _iconFrame = CGRectMake(kMagin, 3*kMagin, 44.f, 44.f);
    
    //姓名frame
    CGFloat nameFrameH = [personModel.name heightForWidth:[UIScreen mainScreen].bounds.size.width Font:kBigFont];
    CGFloat nameFrameW = [personModel.name widthForWidth:[UIScreen mainScreen].bounds.size.width Font:kBigFont];
    _nameFrame = CGRectMake(CGRectGetMaxX(_iconFrame)+kMagin, CGRectGetMinY(_iconFrame)+2.f, nameFrameW, nameFrameH);
    
    //文字frame
    _textFrame = CGRectMake(CGRectGetMinX(_nameFrame), CGRectGetMaxY(_nameFrame)+kMagin, [UIScreen mainScreen].bounds.size.width-kMagin-CGRectGetMinX(_nameFrame), [personModel.text heightForWidth:[UIScreen mainScreen].bounds.size.width-kMagin-CGRectGetMinX(_nameFrame) Font:kBigFont]);
    
    //图片frame
    if (personModel.pics.length == 0)
    {
        _picFrame=CGRectZero;
        //点赞数frame
        _countFrame = CGRectMake([UIScreen mainScreen].bounds.size.width-9*kMagin,CGRectGetMaxY(_textFrame)+kMagin, 60.f, 22.f);
    }
    else{
        _picFrame = CGRectMake(CGRectGetMinX(_textFrame), CGRectGetMaxY(_textFrame)+kMagin, 200.f, 240.f);
        //点赞数frame
        _countFrame = CGRectMake([UIScreen mainScreen].bounds.size.width-9*kMagin,CGRectGetMaxY(_picFrame)+kMagin, 60.f, 22.f);
    }
    
    
    //时间frame
    CGFloat timeFrameH = [personModel.time heightForWidth:[UIScreen mainScreen].bounds.size.width Font:kSmallFont];
    _timeFrame = CGRectMake([UIScreen mainScreen].bounds.size.width*0.75,CGRectGetMinY(_nameFrame), 120.f, timeFrameH);
    
    

}

-(CGFloat)cellHeight{
    return CGRectGetMaxY(_countFrame)+kMagin;
}
@end
