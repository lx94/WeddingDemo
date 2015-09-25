//
//  JHBSystemInvitationTableViewController.m
//  WeddingDemo
//
//  Created by neuedu on 15/9/18.
//  Copyright (c) 2015年 Misted. All rights reserved.
//

#import "JHBSystemInvitationTableViewController.h"
#import "NSString+MoreExtentions.h"

#define kessayTitleFont [UIFont systemFontOfSize:19.f]
#define kauthorNameFont [UIFont systemFontOfSize:12.f]
#define kessayFont [UIFont systemFontOfSize:18.f]
@interface JHBSystemInvitationTableViewController ()

@property (copy,nonatomic) NSString *essayTitle;
@property (copy,nonatomic) NSString *authorName;
@property (copy,nonatomic) NSString *essay;
@end

@implementation JHBSystemInvitationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *headerView = [[UIImageView alloc]init];
    headerView = [UIImage imageNamed:@""];
    self.tableView.tableHeaderView = headerView;
    
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    _essayTitle = @"在日本做码农更像包工头，工作都一层一层包出去";
    _authorName = @"perter";
    _essay = @"  无论是对于中、美，还是对于世界来说，习主席此次对美国的访问都具有里程碑式的意义，因为这是崛起中的中国与作为世界秩序主导者的美国，第一次足够坦诚地交流。在中美近年来关系微妙,摩擦不断的大背景下，如何增信释疑、聚焦合作已经成为当前中美能否共创未来的关键所在。在这种情况下，拓展中美双方新的合作空间，打破美国排华精英团体在对华政策中的垄断就极为重要，前者是示之以利，后者是晓之以理，唯有如此才能实现与美方有理、有利有节，斗而不破，在斗争中求团结、促合作，推动国际秩序转型，并最终构建新型大国关系的战略目标。这个战略目标的实现不仅对于中国来说是正当的，而且对于美国来说也是有利的。中美关系的最终形态不是美方一些人所可以夸大的中国对美国霸权的取代，而是中美关系乃至全球国际关系中的去霸权化。以美国的军事霸权和西方的经济霸权为基础的全球资本主义秩序，已经无法适应逐步出现的，后冷战时代的多极化世界。在全球资本主义世界的边缘，西方主导的秩序正在面临不可阻挡的挑战，这种挑战在有的地方表现为对峙与冲突，如乌克兰；在有的地方则表现为无政府的混乱，如叙利亚；而在有的地方如新兴国家则表现为，新秩序对旧秩序的逐步替代。美国如果不承认这一不可逆转的发展趋势，如果继续试图维持对新兴国家施加传统意义上的霸权，那么它只会遭遇更多的挫折。对于美国来说，寻求与新兴大国的合作，尤其是寻求与中国的有效合作，将是它继续在一定程度上维持全球领导地位的关键。而对于中国来说，避免与美国的关系出现结构性的对冲，也是维持周边局势稳定、深化改革开放、进一步实现大国崛起的唯一选择。";
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setFullScreen:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self setFullScreen:NO];
}
- (void)setFullScreen:(BOOL)fullScreen
{
    // 状态条
    //[UIApplication sharedApplication]. = fullScreen;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EssayTitleCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.row ==0) {
        cell.textLabel.text = _essayTitle;
        cell.textLabel.font = kessayTitleFont;
        cell.textLabel.numberOfLines = [_essayTitle heightForWidth:([UIScreen mainScreen].bounds.size.width-40.f) Font:kessayTitleFont]/14.f;
    }else if (indexPath.row ==1){
        cell.textLabel.text = _authorName;
        cell.textLabel.font = kauthorNameFont;
    }else{
        cell.textLabel.text = _essay;
        cell.textLabel.font = kessayFont;
        cell.textLabel.numberOfLines = [_essay heightForWidth:[UIScreen mainScreen].bounds.size.width Font:kessayFont]/8.f;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        CGFloat height = [_essayTitle heightForWidth:([UIScreen mainScreen].bounds.size.width-40.f) Font:kessayTitleFont];
        return height+10;
    }else if (indexPath.row ==1){
        CGFloat height = [_authorName heightForWidth:[UIScreen mainScreen].bounds.size.width Font:kauthorNameFont];
        return height+10;

    }else{
        CGFloat height = [_essay heightForWidth:([UIScreen mainScreen].bounds.size.width-35.f) Font:kessayFont];
        return height+10;

    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end