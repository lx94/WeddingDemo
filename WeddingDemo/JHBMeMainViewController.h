//
//  JHBMeMainViewController.h
//  WeddingDemo
//
//  Created by neuedu on 15/11/2.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHBMeUserNameView.h"
#import "JHBMeMarriedDateView.h"
@interface JHBMeMainViewController : UIViewController<JHBMeUserNameViewDelegate,UIImagePickerControllerDelegate,UINavigationBarDelegate,UIActionSheetDelegate,JHBMeMarriedDateViewDelegate>

@end
