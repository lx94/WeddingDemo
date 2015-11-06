//
//  JHBMeMainViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/11/2.
//  Copyright (c) 2015年 Misted. All rights rese

//

#import "JHBMeMainViewController.h"


@interface JHBMeMainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *icon;
@property (weak, nonatomic) IBOutlet UIButton *userName;


@end

@implementation JHBMeMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
  
    NSString* filepath = [docPath stringByAppendingPathComponent:@"userinfo.plist"];
    
    
    NSDictionary * dict=[NSDictionary dictionaryWithContentsOfFile:filepath];
    
    [dict writeToFile:filepath atomically:YES];
    
    NSString* name=[[NSUserDefaults standardUserDefaults]objectForKey:@"cleverName"];
    [_userName setTitle:name forState:UIControlStateNormal];

    
    
    // Do any additional setup after loading the view.
     _icon.layer.borderColor=(__bridge CGColorRef)([UIColor colorWithRed:243.f/255.f green:141.f/255.f blue:127.f/255.f alpha:1.0f]);
     //[_icon setTitle:@"头像" forState:UIControlStateNormal];
     //_icon.layer.borderWidth=6.0f;
     NSString* fileName = [docPath stringByAppendingPathComponent:@"icon.png"];
     NSData* imagedata = [NSData dataWithContentsOfFile:fileName];
     UIImage* image = [UIImage imageWithData:imagedata];
    if (image != nil) {
        [_icon setTitle:@"" forState:UIControlStateNormal];
        [_icon setBackgroundImage:image forState:UIControlStateNormal];
    }
    

//     [_icon setImage:image forState:UIControlStateNormal];
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)EditButton:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"toEditPage" sender:nil];
}
- (IBAction)dateButton:(UIButton *)sender
{
    JHBMeMarriedDateView*marriedDate=[JHBMeMarriedDateView JHBMeMarriedDateView];
    [marriedDate showInView1:self.view.window];
    marriedDate.delegate=self;
    
}
-(void)JHBMeMarriedDateViewDidConfirm:(JHBMeMarriedDateView *)saveList
{
    [saveList hidden1];
    

}
- (IBAction)setButton:(UIButton *)sender
{
[self performSegueWithIdentifier:@"toSetPage" sender:nil];
}
- (IBAction)saveButton:(UIButton *)sender
{
[self performSegueWithIdentifier:@"toSavePage" sender:nil];
}
- (IBAction)messageButton:(UIButton *)sender
{
[self performSegueWithIdentifier:@"toMessagePage" sender:nil];
}
- (IBAction)icon:(UIButton *)sender {

    UIActionSheet * sheet=[[UIActionSheet alloc]initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"更改头像" otherButtonTitles:nil, nil];
 
    [sheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
        {
                 UIImagePickerController*controller=[[UIImagePickerController alloc]init];
                 controller.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
            controller.delegate = self;

            
            
            
                 
                 //模态对话框的切换
                 [self presentViewController:controller animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
     UIImage *image=info[UIImagePickerControllerOriginalImage];
     
     CGSize size = CGSizeMake(100, 100);
     UIGraphicsBeginImageContext(size);
     
     CGRect rect = CGRectMake(0, 0, 100, 100);
     [image drawInRect:rect];
     
     image = UIGraphicsGetImageFromCurrentImageContext();
     
     UIGraphicsEndImageContext();
     
     CGFloat boarder = 2.f;
     UIImage* oldImage = image;
     
     CGFloat imageWith = oldImage.size.width+2*boarder;
     CGFloat imageHeight = oldImage.size.height+2*boarder;
     
     UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageWith, imageHeight), NO, 0.0);
     
     CGContextRef cxt = UIGraphicsGetCurrentContext();
     [[UIColor colorWithRed:241.f/255.f green:89.f/255.f blue:71.f/255.f alpha:1.0f] set];
     CGContextAddEllipseInRect(cxt, CGRectMake(0, 0, imageWith, imageHeight));
     // CGContextSetFillColorWithColor(cxt, [[UIColor purpleColor]CGColor]);
     //CGContextStrokePath(cxt);
     CGContextFillPath(cxt);
     
     //CGContextFillEllipseInRect(cxt, CGRectMake(0, 0, imageWith, imageHeight));
     
     
     CGContextAddEllipseInRect(cxt, CGRectMake(boarder, boarder, oldImage.size.width, oldImage.size.height));
     //CGContextStrokePath(cxt);
     CGContextClip(cxt);
     
     [oldImage drawInRect:CGRectMake(boarder, boarder, oldImage.size.width, oldImage.size.height)];
     
     image = UIGraphicsGetImageFromCurrentImageContext();
     
     UIGraphicsEndImageContext();

     
     
     
     NSData* imagedata = UIImagePNGRepresentation(image);
     
     NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
     NSString* fileName = [docPath stringByAppendingPathComponent:@"icon.png"];
     [imagedata writeToFile:fileName atomically:YES];

     [_icon setBackgroundImage:image forState:UIControlStateNormal];
   
    [_icon setTitle:@"" forState:UIControlStateNormal];

     //[_icon setTitle:@"" forState:UIControlStateNormal];
     [picker dismissViewControllerAnimated:YES completion:nil];
     
     
}

- (IBAction)userName:(UIButton *)sender {
    JHBMeUserNameView*saveList=[JHBMeUserNameView JHBMeUserNameView];
    
    //蒙板显示
    [saveList showInView:self.view.window];
    saveList.delegate=self;
    }

#pragma mark 按钮代理函数
-(void)JHBMeUserNameViewDidSaveListConfirm:(JHBMeUserNameView *)saveList
{
 
    
    [saveList hidden];
    
    if (saveList.saveListName.text.length==0)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIAlertView*alertView=[[UIAlertView alloc]initWithTitle:@"用户名不能为空" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];

        });
    }
    else
    {
        [_userName setTitle:saveList.saveListName.text forState:UIControlStateNormal];
        [[NSUserDefaults standardUserDefaults]setObject:saveList.saveListName.text forKey:@"name"];
//        NSDictionary* dict = @{@"username": saveList.saveListName.text,
//                               };
//        NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//        NSString* filepath = [docPath stringByAppendingPathComponent:@"userinfo.plist"];
//        [dict writeToFile:filepath atomically:YES];
    }
}

-(void)JHBMeUserNameViewDidSaveListConfirm1:(JHBMeUserNameView *)saveList
{
    [saveList hidden];
}

@end
