//
//  JHBToolsOurStoryViewController.h
//  WeddingDemo
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
#import <Parse/Parse.h>
#import "CoreDataMngTool.h"

@class JHBToolsOurStoryViewController;

@protocol toolsOurStoryViewDelegate <NSObject>

@required
-(NSArray *)toolsOurStoryViewDelegate:(NSArray *)objects;

@end


@interface JHBToolsOurStoryViewController : UIViewController

@property (weak, nonatomic) UITextField *storyName;
@property (weak, nonatomic) UITextView *story;
@property (weak, nonatomic) UIButton *saveButton;
@property (weak, nonatomic) id<toolsOurStoryViewDelegate> delegate;
@property (strong, nonatomic) NSArray *array;

@end
