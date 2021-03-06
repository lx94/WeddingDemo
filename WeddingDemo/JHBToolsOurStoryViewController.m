//
//  JHBToolsOurStoryViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsOurStoryViewController.h"
#import "JHBToolsLoveJourneyViewController.h"

#define XMargin 5.f
#define KMargin 20.f
#define YMargin 70.f
#define NAMEFONT [UIFont systemFontOfSize:16.f]
#define TEXTFONT [UIFont systemFontOfSize:14.f]

@interface JHBToolsOurStoryViewController ()
{
    BOOL touchTestView;
}
@end

@implementation JHBToolsOurStoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightAddClick)];
//    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(leftAddClick)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    [self addSubViews];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
    [self.view endEditing:YES];
}

//- (void)rightAddClick
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (void)leftAddClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addSubViews
{
    UILabel *name = [[UILabel alloc]init];
    name.text = @"标题";
    name.font = NAMEFONT;
    name.textColor = [UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1];
    name.frame = CGRectMake(KMargin, YMargin, 40.f, 30.f);
    [self.view addSubview:name];
    
    UITextField *storyName = [[UITextField alloc]init];
    storyName.frame = CGRectMake(name.right + XMargin, YMargin, [UIScreen mainScreen].bounds.size.width - name.right - 2 * KMargin, name.height);
    storyName.borderStyle = UITextBorderStyleNone;
    storyName.textAlignment = NSTextAlignmentCenter;
    storyName.font = TEXTFONT;
    storyName.placeholder=@"请为你们的爱情故事写一个名字";
    _storyName = storyName;
    [self.view addSubview:_storyName];
    
    UIView *underLine = [[UIView alloc]init];
    underLine.frame = CGRectMake(storyName.left, name.bottom, storyName.width, 1);
    underLine.backgroundColor = [UIColor colorWithRed:227.f/255.f green:227.f/255.f blue:227.f/255.f alpha:1];
    [self.view addSubview:underLine];

    UILabel *text = [[UILabel alloc]init];
    text.text = @"内容";
    text.font = NAMEFONT;
    text.textColor = [UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1];
    text.frame = CGRectMake(name.left, name.bottom + KMargin, name.width, name.height);
    [self.view addSubview:text];
    
    UITextView *story = [[UITextView alloc]init];
    story.frame = CGRectMake(storyName.left, text.top, storyName.width, 240.f);
    story.textAlignment = NSTextAlignmentLeft;
    story.font = TEXTFONT;
    story.alpha = 0.7;
    _story = story;
    [self.view addSubview:_story];
    
    UIView *storyOnLine = [[UIView alloc]init];
    storyOnLine.frame = CGRectMake(story.left, story.top, story.width, 1);
    storyOnLine.backgroundColor = [UIColor colorWithRed:227.f/255.f green:227.f/255.f blue:227.f/255.f alpha:1];
    [self.view addSubview:storyOnLine];
    
    UIView *storyLeftLine = [[UIView alloc]init];
    storyLeftLine.frame = CGRectMake(story.left, story.top, 1, story.height);
    storyLeftLine.backgroundColor = [UIColor colorWithRed:227.f/255.f green:227.f/255.f blue:227.f/255.f alpha:1];
    [self.view addSubview:storyLeftLine];
    
    UIView *storyRightLine = [[UIView alloc]init];
    storyRightLine.frame = CGRectMake(story.right, story.top, 1, story.height);
    storyRightLine.backgroundColor = [UIColor colorWithRed:227.f/255.f green:227.f/255.f blue:227.f/255.f alpha:1];
    [self.view addSubview:storyRightLine];
    
    UIView *storyUnderLine = [[UIView alloc]init];
    storyUnderLine.frame = CGRectMake(story.left, story.bottom, story.width, 1);
    storyUnderLine.backgroundColor = [UIColor colorWithRed:227.f/255.f green:227.f/255.f blue:227.f/255.f alpha:1];
    [self.view addSubview:storyUnderLine];
    
    UIButton *saveButton = [[UIButton alloc]init];
    saveButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.78, storyUnderLine.bottom + XMargin, 60.f, 44.f);
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    saveButton.titleLabel.font = NAMEFONT;
    saveButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [saveButton setTitleColor:[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1] forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor colorWithRed:111.f/255.f green:44.f/255.f blue:37.f/255.f alpha:1] forState:UIControlStateHighlighted];
    [saveButton addTarget:self action:@selector(saveButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _saveButton = saveButton;
    [self.view addSubview:_saveButton];
}

- (void)saveButtonClick:(NSArray *)array
{
    if ([_delegate respondsToSelector:@selector(toolsOurStoryViewDelegate:)])
    {
        [_delegate toolsOurStoryViewDelegate:array];
    }
    NSLog(@"...");
    PFObject * object = [PFObject objectWithClassName:@"JHBToolsStory"];
    [object setObject:_storyName.text forKey:@"name"];
    [object setObject:_story.text forKey:@"text"];
    
    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (!succeeded)
         {
             //Go back to the wall
             NSString *errorString = [[error userInfo] objectForKey:@"error"];
             UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
             [errorAlertView show];
         }
         else
         {
             UIAlertView *alterView = [[UIAlertView alloc]initWithTitle:@"添加成功" message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
             [alterView show];
             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                 PFQuery * query = [PFQuery queryWithClassName:@"JHBToolsStory"];
//                 [query findObjectsInBackgroundWithBlock:^(NSArray * objects,NSError * error){
//                     if(!error){
//                         NSLog(@"%@",objects);
//                         [CoreDataMngTool searchAllStroyLists] = objects;
                         [self.navigationController popViewControllerAnimated:YES];
//                }}];
             });
         }
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
