//
//  JHBFavourateViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBFavourateViewController.h"
#import "JHBCategoryViewController.h"
#import "JHBMeFavourateView.h"
@interface JHBFavourateViewController ()

@end

@implementation JHBFavourateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    for (int i=0; i<3; i++)
    {
        JHBMeFavourateView*FavourateView=[JHBMeFavourateView LoveClicked];
        FavourateView.frame=CGRectMake(0, 80*i, 375,70);
        [self.view addSubview:FavourateView];
    }
  
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
