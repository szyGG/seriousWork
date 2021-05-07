//
//  BaseViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2020/12/28.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITE_COLOR;
    self.navigationController.navigationBar.translucent = NO;
}


-(void)dealloc
{
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
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
