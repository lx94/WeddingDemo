//
//  JHBToolsSeatingViewController.h
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataMngTool.h"
#import "JHBSeat.h"
#import "JHBSeatFrameModel.h"
#import "JHBToolsSeatViewCell.h"

@interface JHBToolsSeatingViewController : UIViewController<UIActionSheetDelegate,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray  *array;

@end
