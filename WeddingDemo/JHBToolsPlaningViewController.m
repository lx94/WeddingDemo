//
//  JHBToolsPlaningViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/25.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBToolsPlaningViewController.h"

#define VIEWFRAMEY [UIScreen mainScreen].bounds.size.height-667.f*(160.f/667.f)

@interface JHBToolsPlaningViewController ()

@property (weak, nonatomic) UIButton *toolsButton_1;
@property (weak, nonatomic) UIButton *toolsButton_2;
@property (weak, nonatomic) UIButton *toolsButton_3;
@property (weak, nonatomic) UIButton *toolsButton_4;
@property (weak, nonatomic) UIButton *toolsButton_5;
@property (weak, nonatomic) UIButton *toolsButton_6;
@property (weak, nonatomic) UIButton *tempToolsButton;

@property (weak, nonatomic) UIView *underLine_1;
@property (weak, nonatomic) UIView *underLine_2;
@property (weak, nonatomic) UIView *underLine_3;
@property (weak, nonatomic) UIView *underLine_4;
@property (weak, nonatomic) UIView *underLine_5;
@property (weak, nonatomic) UIView *underLine_6;
@property (weak, nonatomic) UIView *tempUnderLine;

@property (assign, nonatomic) NSMutableArray *indexArray;
@property (strong, nonatomic) NSMutableArray *nameArray;

@property(assign,nonatomic) NSUInteger  picIndex;


//@property (strong,nonatomic)NSArray*  textArray;
//@property (strong,nonatomic)NSArray*  picArray;

@end

@implementation JHBToolsPlaningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightAddClick)];
//    self.navigationItem.rightBarButtonItem = rightButton;
    _picIndex = -1;
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(leftAddClick)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    [self addSubViews];
    
    _indexArray = [NSMutableArray array];
    //_textView.frame = CGRectMake(0, 160.f, 0, VIEWFRAMEY);
    _textView.alpha = 0;
    [_returnButton setTitleColor:[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1] forState:UIControlStateNormal];
    [_nextButton setTitleColor:[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1] forState:UIControlStateNormal];
    [_frontButton setTitleColor:[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1] forState:UIControlStateNormal];

    
    [self nextButton:nil];
    _text.numberOfLines = 0;
}

//- (void)rightAddClick
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (void)leftAddClick
{
    [self.navigationController popViewControllerAnimated:YES];
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
        [toolsButton setTitleColor:[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1] forState:UIControlStateNormal];
        [toolsButton setTitleColor:[UIColor colorWithRed:111.f/255.f green:44.f/255.f blue:37.f/255.f alpha:1] forState:UIControlStateHighlighted];
        toolsButton.titleLabel.font = BUTTONFONT;
        
        UIView *underline = [[UIView alloc]init];
        underline.backgroundColor = [UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1];
        
        if (i % COLUMNNUM == 0)
        {
            toolsButton.frame = CGRectMake(kMargin/2.f, 6*
                                          kMargin+HEIGHT+TOOLBUTTONHEIGHT*i, w, h);
            underline.frame = CGRectMake(0, toolsButton.bottom, TOOLBUTTONWIDTH-kMargin, 1);
        }
        else
        {
            toolsButton.frame = CGRectMake(kMargin/2.f+165.f, 6*
                                           kMargin+HEIGHT+TOOLBUTTONHEIGHT*i, w, h);
            underline.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-TOOLBUTTONWIDTH+kMargin, toolsButton.bottom, TOOLBUTTONWIDTH-kMargin, 1);
        }
        
        switch (i)
        {
            case 0:
                [toolsButton setTitle:@"婚宴场地" forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(textButton_1Clicked) forControlEvents:UIControlEventTouchUpInside];
                _toolsButton_1 = toolsButton;
                _underLine_1 = underline;
                break;
            case 1:
                [toolsButton setTitle:@"婚礼服饰" forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(textButton_2Clicked) forControlEvents:UIControlEventTouchUpInside];
                _toolsButton_2 = toolsButton;
                _underLine_2 = underline;
                break;
            case 2:
                [toolsButton setTitle:@"场馆道具" forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(textButton_3Clicked) forControlEvents:UIControlEventTouchUpInside];
                _toolsButton_3 = toolsButton;
                _underLine_3 = underline;
                break;
            case 3:
                [toolsButton setTitle:@"婚宴仪式" forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(textButton_4Clicked) forControlEvents:UIControlEventTouchUpInside];
                _toolsButton_4 = toolsButton;
                _underLine_4 = underline;
                break;
            case 4:
                [toolsButton setTitle:@"花艺布置" forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(textButton_5Clicked) forControlEvents:UIControlEventTouchUpInside];
                _toolsButton_5 = toolsButton;
                _underLine_5 = underline;
                break;
            case 5:
                [toolsButton setTitle:@"主题婚礼" forState:UIControlStateNormal];
                [toolsButton addTarget:self action:@selector(textButton_6Clicked) forControlEvents:UIControlEventTouchUpInside];
                _toolsButton_6 = toolsButton;
                _underLine_6 = underline;
                break;
            default:
                break;
        }
        
        [self.view addSubview:toolsButton];
        [self.view addSubview:underline];
        _planName = toolsButton.titleLabel.text;
    }
}

-(void)textButton_1Clicked
{
//    [self performSegueWithIdentifier:@"toPlaningText" sender:self];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect buttonFrame = _toolsButton_1.frame;
        buttonFrame.origin.y = 80.f;
        _toolsButton_1.frame = buttonFrame;
        _tempToolsButton = _toolsButton_1;
        
        CGRect lineFrame = _underLine_1.frame;
        lineFrame.origin.y = _toolsButton_1.bottom;
        _underLine_1.frame = lineFrame;
        _tempUnderLine = _toolsButton_1;
        
        _tempToolsButton = _toolsButton_1;
        _tempUnderLine = _underLine_1;
        
        [_toolsButton_6 removeFromSuperview];
        [_toolsButton_2 removeFromSuperview];
        [_toolsButton_3 removeFromSuperview];
        [_toolsButton_4 removeFromSuperview];
        [_toolsButton_5 removeFromSuperview];
        
        [_underLine_6 removeFromSuperview];
        [_underLine_2 removeFromSuperview];
        [_underLine_3 removeFromSuperview];
        [_underLine_4 removeFromSuperview];
        [_underLine_5 removeFromSuperview];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            //_textView.frame = CGRectMake(0, 160.f, [UIScreen mainScreen].bounds.size.width, VIEWFRAMEY);
            _textView.alpha = 0.8;
        }];
    }];

}

-(void)textButton_2Clicked
{
    //    [self performSegueWithIdentifier:@"toPlaningText" sender:self];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect buttonFrame = _toolsButton_2.frame;
        buttonFrame.origin.y = 80.f;
        _toolsButton_2.frame = buttonFrame;
        
        CGRect lineFrame = _underLine_2.frame;
        lineFrame.origin.y = _toolsButton_2.bottom;
        _underLine_2.frame = lineFrame;
        
        _tempToolsButton = _toolsButton_2;
        _tempUnderLine = _underLine_2;
        
        [_toolsButton_1 removeFromSuperview];
        [_toolsButton_6 removeFromSuperview];
        [_toolsButton_3 removeFromSuperview];
        [_toolsButton_4 removeFromSuperview];
        [_toolsButton_5 removeFromSuperview];
        
        [_underLine_1 removeFromSuperview];
        [_underLine_6 removeFromSuperview];
        [_underLine_3 removeFromSuperview];
        [_underLine_4 removeFromSuperview];
        [_underLine_5 removeFromSuperview];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            //_textView.frame = CGRectMake(0, 160.f, [UIScreen mainScreen].bounds.size.width, VIEWFRAMEY);
            _textView.alpha = 0.8;
        }];
    }];

}

-(void)textButton_3Clicked
{
    //    [self performSegueWithIdentifier:@"toPlaningText" sender:self];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect buttonFrame = _toolsButton_3.frame;
        buttonFrame.origin.y = 80.f;
        _toolsButton_3.frame = buttonFrame;
        
        CGRect lineFrame = _underLine_3.frame;
        lineFrame.origin.y = _toolsButton_3.bottom;
        _underLine_3.frame = lineFrame;
        
        _tempToolsButton = _toolsButton_3;
        _tempUnderLine = _underLine_3;
        
        [_toolsButton_1 removeFromSuperview];
        [_toolsButton_2 removeFromSuperview];
        [_toolsButton_6 removeFromSuperview];
        [_toolsButton_4 removeFromSuperview];
        [_toolsButton_5 removeFromSuperview];
        
        [_underLine_1 removeFromSuperview];
        [_underLine_2 removeFromSuperview];
        [_underLine_6 removeFromSuperview];
        [_underLine_4 removeFromSuperview];
        [_underLine_5 removeFromSuperview];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            //_textView.frame = CGRectMake(0, 160.f, [UIScreen mainScreen].bounds.size.width, VIEWFRAMEY);
            _textView.alpha = 0.8;
        }];
    }];

}

-(void)textButton_4Clicked
{
    //    [self performSegueWithIdentifier:@"toPlaningText" sender:self];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect buttonFrame = _toolsButton_4.frame;
        buttonFrame.origin.y = 80.f;
        _toolsButton_4.frame = buttonFrame;
        
        CGRect lineFrame = _underLine_4.frame;
        lineFrame.origin.y = _toolsButton_4.bottom;
        _underLine_4.frame = lineFrame;
        
        _tempToolsButton = _toolsButton_4;
        _tempUnderLine = _underLine_4;
        
        [_toolsButton_1 removeFromSuperview];
        [_toolsButton_2 removeFromSuperview];
        [_toolsButton_3 removeFromSuperview];
        [_toolsButton_6 removeFromSuperview];
        [_toolsButton_5 removeFromSuperview];
        
        [_underLine_1 removeFromSuperview];
        [_underLine_2 removeFromSuperview];
        [_underLine_3 removeFromSuperview];
        [_underLine_6 removeFromSuperview];
        [_underLine_5 removeFromSuperview];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            //_textView.frame = CGRectMake(0, 160.f, [UIScreen mainScreen].bounds.size.width, VIEWFRAMEY);
            _textView.alpha = 0.8;
        }];
    }];
}

-(void)textButton_5Clicked
{
    //    [self performSegueWithIdentifier:@"toPlaningText" sender:self];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect buttonFrame = _toolsButton_5.frame;
        buttonFrame.origin.y = 80.f;
        _toolsButton_5.frame = buttonFrame;
        
        CGRect lineFrame = _underLine_5.frame;
        lineFrame.origin.y = _toolsButton_5.bottom;
        _underLine_5.frame = lineFrame;
        
        _tempToolsButton = _toolsButton_5;
        _tempUnderLine = _underLine_5;
        
        [_toolsButton_1 removeFromSuperview];
        [_toolsButton_2 removeFromSuperview];
        [_toolsButton_3 removeFromSuperview];
        [_toolsButton_4 removeFromSuperview];
        [_toolsButton_6 removeFromSuperview];
        
        [_underLine_1 removeFromSuperview];
        [_underLine_2 removeFromSuperview];
        [_underLine_3 removeFromSuperview];
        [_underLine_4 removeFromSuperview];
        [_underLine_6 removeFromSuperview];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            //_textView.frame = CGRectMake(0, 160.f, [UIScreen mainScreen].bounds.size.width, VIEWFRAMEY);
            _textView.alpha = 0.8;
        }];
    }];

}

-(void)textButton_6Clicked
{
    //    [self performSegueWithIdentifier:@"toPlaningText" sender:self];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect buttonFrame = _toolsButton_6.frame;
        buttonFrame.origin.y = 80.f;
        _toolsButton_6.frame = buttonFrame;
        
        CGRect lineFrame = _underLine_6.frame;
        lineFrame.origin.y = _toolsButton_6.bottom;
        _underLine_6.frame = lineFrame;
        
        _tempToolsButton = _toolsButton_6;
        _tempUnderLine = _underLine_6;
        
        [_toolsButton_1 removeFromSuperview];
        [_toolsButton_2 removeFromSuperview];
        [_toolsButton_3 removeFromSuperview];
        [_toolsButton_4 removeFromSuperview];
        [_toolsButton_5 removeFromSuperview];
        
        [_underLine_1 removeFromSuperview];
        [_underLine_2 removeFromSuperview];
        [_underLine_3 removeFromSuperview];
        [_underLine_4 removeFromSuperview];
        [_underLine_5 removeFromSuperview];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            //_textView.frame = CGRectMake(0, 160.f, [UIScreen mainScreen].bounds.size.width, VIEWFRAMEY);
            _textView.alpha = 0.8;
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)returnButton:(UIButton *)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        _tempToolsButton.alpha = 0;
        _tempUnderLine.alpha = 0;
        _textView.alpha = 0;
        [self addSubViews];
    } completion:^(BOOL finished) {
        [_tempToolsButton removeFromSuperview];
        [_tempUnderLine removeFromSuperview];
    }];
}

#pragma mark 懒加载
-(NSArray *)nameArray
{
    if (_nameArray == nil)
    {
//        _nameArray = [NSMutableArray array];
//        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"JHBPlaning.plist" ofType:nil]];
//        for (int i = 0; i < array.count; i++)
//        {
//            NSDictionary *dict = array[i];
//            JHBPlaning *model = [JHBPlaning planingTextModel:dict];
//            [_nameArray addObject:model];
//        }
        NSString *filePath=[[NSBundle mainBundle]pathForResource:@"JHBPlaning.plist" ofType:nil];
        _nameArray=[[NSArray arrayWithContentsOfFile:filePath] mutableCopy];
    }
    return _nameArray;
}

//static int picIndex = -1;
- (IBAction)frontButton:(UIButton *)sender
{
//    if (_picIndex>0)
//    {
//        NSDictionary *dict = self.nameArray[_picIndex];
//        [self.pic setImage:[UIImage imageNamed:dict[@"pic"]]];
//        [self.name setText:dict[@"name"]];
//        [self.text setText:dict[@"text"]];
//    }
//    else
//    {
//        _picIndex = 0;
//        if (_picIndex==0)
//        {
//            _frontButton.enabled=NO;
//            _nextButton.enabled=YES;
//            [MBProgressHUD showTipToWindow:@"已经是第一页" afterDelay:0.5];
//        }
//        else
//        {
//            _frontButton.enabled=YES;
//            if (_picIndex==_nameArray.count-1)
//            {
//                _nextButton.enabled=NO;
//            }
//            else
//            {
//                _nextButton.enabled=YES;
//            }
//        }
//    }
//    _picIndex--;
    _picIndex--;
    if (_picIndex==0)
    {
        _frontButton.enabled=NO;
        _nextButton.enabled=YES;
        [MBProgressHUD showTipToWindow:@"已经是第一页" afterDelay:0.5];
        
    }
    else
    {
        _frontButton.enabled=YES;
        if (_picIndex==_nameArray.count-1)
        {
            _nextButton.enabled=NO;
        }
        else
        {
            _nextButton.enabled=YES;
        }
    }
    NSDictionary *dict = self.nameArray[_picIndex];
    [self.pic setImage:[UIImage imageNamed:dict[@"pic"]]];
    [self.name setText:dict[@"name"]];
    [self.text setText:dict[@"text"]];
    if (_picIndex>0)
    {
        
    }
    else
    {
        _picIndex = 0;
    }
}

- (IBAction)nextButton:(UIButton *)sender
{
//    _picIndex++;
//    if(_picIndex > _nameArray.count-1)
//    {
//        _picIndex=(int)_nameArray.count-1;
//        if (_picIndex==_nameArray.count-1)
//        {
//            _nextButton.enabled=NO;
//            _frontButton.enabled=YES;
//            [MBProgressHUD showTipToWindow:@"已经是最后一页" afterDelay:0.5];
//        }
//        else
//        {
//            _nextButton.enabled=YES;
//            if (_picIndex==0)
//            {
//                _frontButton.enabled=NO;
//            }
//            else
//            {
//                _frontButton.enabled=YES;
//            }
//        }
//    }
//    NSDictionary *dict = self.nameArray[_picIndex];
//    [self.pic setImage:[UIImage imageNamed:dict[@"pic"]]];
//    [self.name setText:dict[@"name"]];
//    [self.text setText:dict[@"text"]];
    _picIndex++;
    if (_picIndex==_nameArray.count-1)
    {
        _nextButton.enabled=NO;
        _frontButton.enabled=YES;
        [MBProgressHUD showTipToWindow:@"已经是最后一页" afterDelay:0.5];
    }
    else
    {
        _nextButton.enabled=YES;
        if (_picIndex==0)
        {
            _frontButton.enabled=NO;
        }
        else
        {
            _frontButton.enabled=YES;
        }
    }
    NSDictionary *dict = self.nameArray[_picIndex];
    [self.pic setImage:[UIImage imageNamed:dict[@"pic"]]];
    [self.name setText:dict[@"name"]];
    [self.text setText:dict[@"text"]];
    if(_picIndex > _nameArray.count-1)
    {
        _picIndex=(int)_nameArray.count-1;
    }
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
