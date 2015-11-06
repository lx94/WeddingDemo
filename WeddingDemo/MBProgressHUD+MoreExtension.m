//
//  MBProgressHUD+MoreExtension.m
//  KGKuGouPlayer
//
//  Created by neuedu on 15/10/20.
//  Copyright (c) 2015年 slx. All rights reserved.
//

#import "MBProgressHUD+MoreExtension.h"

@implementation MBProgressHUD (MoreExtension)

+(instancetype)showHUDAddedTo:(UIView *)view LebelText:(NSString *)labelText animated:(BOOL)animated{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.animationType = MBProgressHUDAnimationZoomOut;
    hud.color = [UIColor lightGrayColor];
    hud.labelText = labelText;
    return hud;
}

+(void)showTipToWindow:(NSString *)tip{
    //提示应该保证足够的提示时间，一般将会把它显示到导航栏或window
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = [NSString stringWithFormat:@"%@",tip];
    //屏幕下方，1/4处
    hud.yOffset = [UIScreen mainScreen].bounds.size.height *0.25;
    [hud hide:YES afterDelay:2.0f];

}


+(void)showTipToWindow:(NSString *)tip afterDelay:(NSTimeInterval)timer
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = tip;
    hud.yOffset = ([UIScreen mainScreen].bounds.size.height/2.f)/2.f;
    [hud hide:YES afterDelay:2.f];
}



@end
