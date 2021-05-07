//
//  NewsViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2020/12/28.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@property (nonatomic , strong) UIButton *btn;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"资讯";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    self.btn = btn;
    btn.frame = CGRectMake(20, 100, 60, 40);
    btn.backgroundColor = UIColor.redColor;
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(select) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)select {
    [UIView animateWithDuration:2.0 animations:^{
        
        self.btn.frame = CGRectMake(20, 400, 60, 40);
        NSLog(@"%f",self.btn.frame.origin.y);
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
