//
//  NavigationViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:NDUICONFIG.navigaTitleFont,NSFontAttributeName,
                                              NDUICONFIG.navigaBarTextColor,NSForegroundColorAttributeName, nil];
    [self.navigationBar setBarTintColor:NDUICONFIG.navigaBarColor];
    [self.navigationBar setTintColor:NDUICONFIG.navigaBarTextColor];
    self.navigationBar.translucent = NO;
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
