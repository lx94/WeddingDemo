//
//  JHBLoginViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBLoginViewController.h"
#import <Parse/Parse.h>
#import "JHBHomePageTableViewController.h"
#import "JHBHomeViewController.h"
@interface JHBLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
- (IBAction)login:(UIButton *)sender;
- (IBAction)resgin:(UIButton *)sender;

@end

@implementation JHBLoginViewController

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
#pragma mark 用户登录
- (IBAction)login:(UIButton *)sender {
    PFUser* user=[PFUser user];
    user.username=_name.text;
    user.password=_pwd.text;
    [PFUser logInWithUsernameInBackground:user.username password:user.password block:^(PFUser *user, NSError *error) {
        if (user) {
            //Open the wall
            NSLog(@"login sucess");
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isLogin"];
            
            //获取用户信息
            NSString* cleverName=[user objectForKey:@"cleverName"];
            NSString *icon = ((PFFile *)[user objectForKey:@"icon"]).url;
            //将申请下的用户数据存入沙盒
            [[NSUserDefaults standardUserDefaults]setObject:cleverName
                                                     forKey:@"cleverName"];
            [[NSUserDefaults standardUserDefaults]setObject:_name.text forKey:@"userName"];
            [[NSUserDefaults standardUserDefaults]setObject:_pwd.text forKey:@"password"];
            [[NSUserDefaults standardUserDefaults]setObject:icon forKey:@"icon"];
            
            JHBHomeViewController* p1=[[JHBHomeViewController alloc]init];
            [UIApplication sharedApplication].keyWindow.rootViewController=p1;
            
        } else {
            //Something bad has ocurred
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    
    
}
#pragma mark 用户注册
- (IBAction)resgin:(UIButton *)sender {
    [self performSegueWithIdentifier:@"toResgin" sender:nil];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}
@end
