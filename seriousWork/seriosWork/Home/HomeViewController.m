//
//  HomeViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2020/12/28.
//

#import "HomeViewController.h"
#import "NDPopView.h"
#import "SeriousHeader.h"
#import "ccccViewController.h"
#import "ScrollTableViewController.h"
#import "drawViewController.h"
#import "draw2ViewController.h"
#import "TransformViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation HomeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";

    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    
 
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.view addSubview:btn];
//    btn.frame = CGRectMake(20, 100, 60, 40);
//    btn.backgroundColor = UIColor.redColor;
//    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(select) forControlEvents:UIControlEventTouchUpInside];
//
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.view addSubview:btn1];
//    btn1.frame = CGRectMake(20, 200, 60, 40);
//    btn1.backgroundColor = UIColor.redColor;
//    [btn1 setTitle:@"点我啊1" forState:UIControlStateNormal];
//    [btn1 addTarget:self action:@selector(select1) forControlEvents:UIControlEventTouchUpInside];
//
//    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.view addSubview:btn2];
//    btn2.frame = CGRectMake(20, 300, 60, 40);
//    btn2.backgroundColor = UIColor.redColor;
//    [btn2 setTitle:@"涂鸦" forState:UIControlStateNormal];
//    [btn2 addTarget:self action:@selector(select2) forControlEvents:UIControlEventTouchUpInside];
//
//    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.view addSubview:btn3];
//    btn3.frame = CGRectMake(100, 300, 80, 40);
//    btn3.backgroundColor = UIColor.redColor;
//    [btn3 setTitle:@"涂鸦升级" forState:UIControlStateNormal];
//    [btn3 addTarget:self action:@selector(select3) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)select{
    ccccViewController *vc= [[ccccViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)select1{
    ScrollTableViewController *vc= [[ScrollTableViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)select2{
    drawViewController *vc= [[drawViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)select3{
    draw2ViewController *vc= [[draw2ViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSString *title = @"";
    switch (indexPath.row) {
        case 0:
            title = @"点我啊";
            break;
        case 1:
            title = @"点我啊1";
            break;
        case 2:
            title = @"涂鸦";
            break;
        case 3:
            title = @"涂鸦升级";
            break;
        case 4:
            title = @"calyer";
            break;
        default:
            break;
    }
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self select];
            break;
        case 1:
            [self select1];
            break;
        case 2:
            [self select2];
            break;
        case 3:
            [self select3];
            break;
        case 4:{
            TransformViewController *vc= [[TransformViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return UIView.new;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return UIView.new;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = BACKGROUND_COLOR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
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
