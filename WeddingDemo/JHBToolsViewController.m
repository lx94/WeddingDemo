//
//  JHBToolsViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsViewController.h"
#import "JHBToolsLoveJourneyViewController.h"
#import <Parse/Parse.h>
#import "JHBToolsSeatingViewController.h"
#define PRAISEFONT [UIFont systemFontOfSize:12.f]

@interface JHBToolsViewController ()

@property (weak, nonatomic) UIView *tempView;
@property (weak, nonatomic) UIView *praiseView;
@property (weak, nonatomic) UIView *praiseBGView;
@property (weak, nonatomic) UIView *heightLine;
@property (weak, nonatomic) UIButton *praiseButton;
@property (weak, nonatomic) UILabel *upLabel;
@property (weak, nonatomic) UILabel *praiseCount;
@property (weak, nonatomic) UILabel *addLabel;

@end

@implementation JHBToolsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSubViews];
    
    JHBToolsPraiseView *praiseView = [JHBToolsPraiseView toolsPraiseView];
    praiseView.frame = CGRectMake(TOOLBUTTONWIDTH, _tempView.bottom+([UIScreen mainScreen].bounds.size.height-_tempView.bottom-44.f)*0.5, TOOLBUTTONWIDTH, 44.f);
    _praiseView = praiseView;
    praiseView.delegate = self;
    [self.view addSubview:praiseView];
    _praiseBGView.hidden = YES;
    _praiseView.hidden = YES;
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
        CGFloat row = i / COLUMNNUM;
        CGFloat column = i % COLUMNNUM;
            
        CGFloat x = w * column;
        CGFloat y = 0;

        y = h * row;
        
        JHBToolsButton *toolsButton = [[JHBToolsButton alloc]init];
        toolsButton.frame = CGRectMake(x, y + HEIGHT, w, h);
        [toolsButton setTitleColor:[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1] forState:UIControlStateNormal];
        [toolsButton setTitleColor:[UIColor colorWithRed:111.f/255.f green:44.f/255.f blue:37.f/255.f alpha:1] forState:UIControlStateHighlighted];
        toolsButton.titleLabel.font = BUTTONFONT;
        toolsButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [toolsButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wedding_%d",i+1]] forState:UIControlStateNormal];
        
        switch (i)
        {
            case 0:
                break;
            case 1:
                [toolsButton setTitle:@"良辰吉日" forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(LuckyDateClicked) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 2:
                break;
            case 3:
                [toolsButton setTitle:@"完美策划" forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(planingClicked) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 4:
                [toolsButton setTitle:@"给个赞呗" forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(lovedClicked) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 5:
                [toolsButton setTitle:@"恋爱旅程" forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(loveJourneyClicked) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 6:
                break;
            case 7:
                [toolsButton setTitle:@"座位安排" forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(seatingClicked) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 8:
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
        _tempView = widthline;
        [self.view addSubview:widthline];
        
    }
    for (int i = 0; i < ROWNUM + 1; i++)
    {
        UIView *heightline = [[UIView alloc]init];
        heightline.frame = CGRectMake(i * w, HEIGHT, 1, COLUMNNUM * TOOLBUTTONHEIGHT);
        heightline.backgroundColor = [UIColor colorWithRed:227.f/255.f green:227.f/255.f blue:227.f/255.f alpha:1];
        _heightLine = heightline;
        [self.view addSubview:heightline];
    }

    UIView *praiseView = [[UIView alloc]init];
    praiseView.frame = CGRectMake(TOOLBUTTONWIDTH, _tempView.bottom+([UIScreen mainScreen].bounds.size.height-_tempView.bottom-44.f)*0.5, TOOLBUTTONWIDTH, 44.f);
    praiseView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    praiseView.layer.borderWidth = 0.5;
    praiseView.layer.cornerRadius = 5.f;
    _praiseBGView = praiseView;
    [self.view addSubview:_praiseBGView];
    [_praiseBGView bringSubviewToFront:_praiseView];
    
    UILabel *praiseText_1 = [[UILabel alloc]init];
    praiseText_1.text = @"已有        人喜欢";
    praiseText_1.textColor = [UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1];
    praiseText_1.font = PRAISEFONT;
    praiseText_1.frame = CGRectMake(_praiseBGView.right+30.f, _praiseBGView.top+15.f, 90.f, _praiseBGView.height);
    [self.view addSubview:praiseText_1];
    
    UILabel *praiseCount = [[UILabel alloc]init];
    praiseCount.text = @"2000";
    praiseCount.font = PRAISEFONT;
    praiseCount.textColor = [UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1];
    praiseCount.frame = CGRectMake(_praiseBGView.right+55.f, _praiseBGView.top+15.f, 90.f, _praiseBGView.height);
    _praiseCount = praiseCount;
    [self.view addSubview:praiseCount];
}

- (void)seatingClicked
{
    PFQuery * query = [PFQuery queryWithClassName:@"JHBToolsSeating"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * objects,NSError * error){
        if(!error){
            NSLog(@"%@",objects);
            [self performSegueWithIdentifier:@"toSeating" sender:objects];
        }}];
}

- (void)loveJourneyClicked
{
    [self performSegueWithIdentifier:@"toLoveJourney" sender:nil];
    
}

- (void)planingClicked
{
    [self performSegueWithIdentifier:@"toPlaningPage" sender:nil];
}

- (void)LuckyDateClicked
{
    [self performSegueWithIdentifier:@"toLuckyDate" sender:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[JHBToolsLuckyDateViewController class]])
    {
        JHBToolsLuckyDateViewController *luckyDate = segue.destinationViewController;
        luckyDate.url = @"http://wnl.chemdrug.com";
    }
//    if ([segue.destinationViewController isKindOfClass:[JHBToolsLoveJourneyViewController class]]) {
//        JHBToolsLoveJourneyViewController * loveVC=segue.destinationViewController;
//        loveVC.array=sender;
//    }
    if ([segue.destinationViewController isKindOfClass:[JHBToolsSeatingViewController class]]) {
        JHBToolsSeatingViewController * SeatVC=segue.destinationViewController;
        SeatVC.array=sender;
    }
}

- (void)lovedClicked
{
    [UIView animateWithDuration:2.f animations:^{
        _praiseView.hidden = NO;
        _praiseBGView.hidden = NO;
    }];
}

- (void)toolsPraiseViewDidPraiseButtonClicked:(UIButton *)sender
{
    UILabel *addLabel = [[UILabel alloc]init];
    addLabel.text = @"+1";
    addLabel.textColor = [UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1];
    addLabel.frame = CGRectMake(_praiseBGView.right, _praiseBGView.top, 20.f, _praiseBGView.height);
    [self.view addSubview:addLabel];
    [UIView animateWithDuration:1.f animations:^{
        addLabel.frame = CGRectMake(_praiseBGView.right+TOOLBUTTONWIDTH*0.5, _heightLine.bottom, 20.f, _praiseBGView.height);
        addLabel.alpha = 0.0;
        int oldCount = [_praiseCount.text intValue];
        int newCount = oldCount+1;
        _praiseCount.text = [NSString stringWithFormat:@"%d",newCount];
    } completion:^(BOOL finished) {
        [addLabel removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
