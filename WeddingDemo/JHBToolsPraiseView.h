//
//  JHBToolsPraiseView.h
//  WeddingDemo
//
//  Created by neuedu on 15/10/13.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHBToolsPraiseView;
@protocol JHBToolsPraiseViewDelegate <NSObject>

@required
- (void) toolsPraiseViewDidPraiseButtonClicked:(UIButton *)sender;

@end

@interface JHBToolsPraiseView : UIView

@property (weak, nonatomic) IBOutlet UILabel *praiseLabel;
@property (weak, nonatomic) IBOutlet UIImageView *praiseLine;
@property (weak, nonatomic) IBOutlet UIButton *praiseButton;

@property (weak, nonatomic) id<JHBToolsPraiseViewDelegate> delegate;

+ (instancetype)toolsPraiseView;
- (IBAction)praiseButtonClick:(UIButton *)sender;

@end
