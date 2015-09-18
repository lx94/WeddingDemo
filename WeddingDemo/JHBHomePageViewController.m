//
//  JHBHomePageViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBHomePageViewController.h"
#import "JHBHomePageDataModel.h"
#import "JHBHomePageTableViewCell.h"
#import "JHBHomePageSection0TableViewCell.h"
@interface JHBHomePageViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) UITableView * tableView;
@property (strong, nonatomic) NSMutableArray * groupPurchaseArray;
@end

@implementation JHBHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatTableView];
}
#pragma mark - creatTableView
-(void)creatTableView
{
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.sectionFooterHeight = 1;
    //tableView.sectionHeaderHeight = 20;
    [self.view addSubview:tableView];
}
#pragma mark - 懒加载
-(NSMutableArray *)groupPurchaseArray
{
    if (_groupPurchaseArray == nil) {
        NSString * path = [[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil];
        NSArray * dataArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * tempArray = [NSMutableArray array];
        for (NSDictionary * dict in dataArray) {
            JHBHomePageDataModel * tg = [JHBHomePageDataModel groupPurchaseWithDictionary:dict];
            [tempArray addObject:tg];
        }
        _groupPurchaseArray = tempArray;
    }
    return _groupPurchaseArray;
}
#pragma mark - 有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
#pragma mark - 有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return self.groupPurchaseArray.count;
}
#pragma mark - cell style
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        JHBHomePageSection0TableViewCell * cell = [JHBHomePageSection0TableViewCell homepageSection0TableViewCellWithTableView : tableView];
        return cell;
    }
    UITableViewCell * cell = [[UITableViewCell alloc]init];
    return cell;
    
    
//    //1.creat cell
//    JHBHomePageTableViewCell * cell1 = [JHBHomePageTableViewCell homePageTableViewCellWithTableView : tableView];
//    //2.load data
//    JHBHomePageDataModel * groupPurchase = _groupPurchaseArray[indexPath.row];
//    //3.setting cell
//    cell1.groupPurchase = groupPurchase;
    

}
#pragma mark - heightForRow
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 126;
    }
    return 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
