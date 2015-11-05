//
//  JHBResginViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBResginViewController.h"
#import <Parse/Parse.h>
@interface JHBResginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UITextField *againPwd;
- (IBAction)resginClicked:(UIButton *)sender;
- (IBAction)Again:(UIButton *)sender;



@end

@implementation JHBResginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
#pragma mark 注册
- (IBAction)resginClicked:(UIButton *)sender {
    if ([_pwd.text isEqualToString:_againPwd.text]) {
        if (_pwd.text.length>6) {
            
        
    PFUser * user=[PFUser user];
    user.username=_name.text;
    user.password=_pwd.text;
   // [user setObject:_name.text forKey:@"name"];
    //[user setObject:@"IOS4" forKey:@"classesName"];
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            //The registration was successful, go to the wall
            // [self performSegueWithIdentifier:@"SignupSuccesful" sender:self];
            NSLog(@"signUp sucess");
            [self performSegueWithIdentifier:@"toLogin" sender:nil];
            
        } else {
            //Something bad has occurred
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    }
        else{
            UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"提示"message:@"密码长度需大于6位" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else{
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"提示"message:@"密码输入不一致" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alertView show];
        [self Again:nil];
    }
}
#pragma mark 重置
- (IBAction)Again:(UIButton *)sender {
    _name.text=@"";
    _pwd.text=@"";
    _againPwd.text=@"";
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}
@end
