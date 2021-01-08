//
//  HomeViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2020/12/28.
//

#import "HomeViewController.h"
#import "NDPopView.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(20, 100, 30, 40);
    btn.backgroundColor = UIColor.redColor;
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(select) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)select{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    contentView.backgroundColor = UIColor.redColor;
    
    NDPopView *pop = [[NDPopView alloc] init];
    pop.insets = UIEdgeInsetsMake(0, 0, TABBAR_HEIGHT + 20, 0);
    [pop addInView:self.view withContentView:contentView];
    [pop showWithDidShowBlock:^(NDPopView *view) {
        NSLog(@"出来了");
    }];
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
