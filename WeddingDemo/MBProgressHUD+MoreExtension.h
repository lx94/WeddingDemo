//
//  MBProgressHUD+MoreExtension.h
//  KGKuGouPlayer
//
//  Created by neuedu on 15/10/20.
//  Copyright (c) 2015年 slx. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (MoreExtension)

+ (MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view LebelText:(NSString *)labelText animated:(BOOL)animated;

//将指定的提示语显示到window上去（2秒）
+ (void)showTipToWindow:(NSString *)tip;
@end
