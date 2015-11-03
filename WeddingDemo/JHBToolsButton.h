//
//  JHBToolsButton.h
//  WeddingDemo
//
//  Created by neuedu on 15/10/14.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEIGHT 64.f
#define BUTTONCOUNT 9
#define COLUMNNUM 3
#define ROWNUM (BUTTONCOUNT/COLUMNNUM)
#define TOOLBUTTONWIDTH [UIScreen mainScreen].bounds.size.width/(BUTTONCOUNT/COLUMNNUM)
#define TOOLBUTTONHEIGHT [UIScreen mainScreen].bounds.size.width/(BUTTONCOUNT/COLUMNNUM)
#define BUTTONFONT [UIFont systemFontOfSize:14.f]

@interface JHBToolsButton : UIButton

@end
