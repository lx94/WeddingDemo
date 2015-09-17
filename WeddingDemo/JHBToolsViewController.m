//
//  JHBToolsViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsViewController.h"

#define HEIGHT 64.f
#define BUTTONCOUNT 9
#define COLUMNNUM 3
#define ROWNUM (BUTTONCOUNT/COLUMNNUM)
#define TOOLBUTTONWIDTH [UIScreen mainScreen].bounds.size.width/(BUTTONCOUNT/COLUMNNUM)
#define TOOLBUTTONHEIGHT [UIScreen mainScreen].bounds.size.width/(BUTTONCOUNT/COLUMNNUM)
#define BUTTONFONT [UIFont systemFontOfSize:14.f]
@interface JHBToolsViewController ()

@end

@implementation JHBToolsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSubViews];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.hidesBackButton = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    self.navigationItem.hidesBackButton = YES;
    [super viewWillDisappear:animated];
}

#pragma mark 添加控件
- (void)addSubViews
{
    CGFloat w =TOOLBUTTONWIDTH;
    CGFloat h =TOOLBUTTONHEIGHT;
    for (int i = 0; i < BUTTONCOUNT; i++)
    {
        UIButton *toolsButton = [[UIButton alloc]init];
        
        CGFloat row = i / COLUMNNUM;
        CGFloat column = i % COLUMNNUM;
            
        CGFloat x = w * column;
        CGFloat y = 0;

        y = h * row;
        
        toolsButton.frame = CGRectMake(x, y + HEIGHT, w, h);

        //toolsButton.backgroundColor = [UIColor colorWithRed:244.f/255.f green:244.f/255.f blue:244.f/255.f alpha:1];
        //toolsButton.backgroundColor = [UIColor cyanColor];
        switch (i)
        {
            case 0:
                [toolsButton setTitle:@"良辰吉日" forState:UIControlStateNormal];
                [toolsButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                toolsButton.titleLabel.font = BUTTONFONT;
                break;
            case 1:
                [toolsButton setTitle:@"婚姻登记" forState:UIControlStateNormal];
                [toolsButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                toolsButton.titleLabel.font = BUTTONFONT;
                break;
            case 2:
                [toolsButton setTitle:@"恋爱旅程" forState:UIControlStateNormal];
                [toolsButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                [toolsButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(loveJourneyClicked) forControlEvents:UIControlEventTouchUpInside];
                toolsButton.titleLabel.font = BUTTONFONT;
                break;
            case 3:
                [toolsButton setTitle:@"完美策划" forState:UIControlStateNormal];
                [toolsButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                toolsButton.titleLabel.font = BUTTONFONT;
                break;
            case 4:
                [toolsButton setTitle:@"遇见幸福" forState:UIControlStateNormal];
                [toolsButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                toolsButton.titleLabel.font = BUTTONFONT;
                break;
            case 5:
                [toolsButton setTitle:@"诚挚邀请" forState:UIControlStateNormal];
                [toolsButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                toolsButton.titleLabel.font = BUTTONFONT;
                break;
            case 6:
                [toolsButton setTitle:@"结婚流程" forState:UIControlStateNormal];
                [toolsButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                toolsButton.titleLabel.font = BUTTONFONT;
                break;
            case 7:
                [toolsButton setTitle:@"座位安排" forState:UIControlStateNormal];
                [toolsButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(seatingClicked) forControlEvents:UIControlEventTouchUpInside];
                toolsButton.titleLabel.font = BUTTONFONT;
                break;
            case 8:
                [toolsButton setTitle:@"分享应用" forState:UIControlStateNormal];
                [toolsButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                toolsButton.titleLabel.font = BUTTONFONT;
                break;
            default:
                break;
        }
        [self.view addSubview:toolsButton];
    }
    for (int i = 1; i < COLUMNNUM + 1; i++)
    {
        UIView *widthline = [[UIView alloc]init];
        widthline.frame = CGRectMake(0, i * h + HEIGHT, [UIScreen mainScreen].bounds.size.width, 1);

        widthline.backgroundColor = [UIColor colorWithRed:227.f/255.f green:227.f/255.f blue:227.f/255.f alpha:1];
        [self.view addSubview:widthline];
        
    }
    for (int i = 0; i < ROWNUM + 1; i++)
    {
        UIView *heightline = [[UIView alloc]init];
        heightline.frame = CGRectMake(i * w, HEIGHT, 1, COLUMNNUM * TOOLBUTTONHEIGHT);
        heightline.backgroundColor = [UIColor colorWithRed:227.f/255.f green:227.f/255.f blue:227.f/255.f alpha:1];
        [self.view addSubview:heightline];
    }

}

- (void)seatingClicked
{
    [self performSegueWithIdentifier:@"toSeating" sender:nil];
}

- (void)loveJourneyClicked
{
    [self performSegueWithIdentifier:@"toLoveJourney" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
