//
//  MainViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2020/12/28.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "NewsViewController.h"
#import "CircleViewController.h"
#import "MineViewController.h"
#import "NavigationViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController *home = [[HomeViewController alloc] init];
    UINavigationController *nav1 = [[NavigationViewController alloc] initWithRootViewController:home];
    
    NewsViewController *new = [[NewsViewController alloc] init];
    UINavigationController *nav2 = [[NavigationViewController alloc] initWithRootViewController:new];
    
    CircleViewController *circle = [[CircleViewController alloc] init];
    UINavigationController *nav3 = [[NavigationViewController alloc] initWithRootViewController:circle];
    
    MineViewController *mine = [[MineViewController alloc] init];
    UINavigationController *nav4 = [[NavigationViewController alloc] initWithRootViewController:mine];
    
    
    home.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页"
                                                   image:[[UIImage  imageNamed:@"ND_Home_Unselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                           selectedImage:[[UIImage imageNamed:@"ND_Home_Select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    new.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"资讯"
                                                  image:[[UIImage  imageNamed:@"ND_News_Unselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                          selectedImage:[[UIImage imageNamed:@"ND_News_Select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    circle.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"消息"
                                                     image:[[UIImage  imageNamed:@"message"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                             selectedImage:[[UIImage imageNamed:@"message_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    mine.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的"
                                                   image:[[UIImage  imageNamed:@"ND_Mine_Unselect"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                           selectedImage:[[UIImage imageNamed:@"ND_Mine_Select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    self.viewControllers = @[nav1,nav2,nav3,nav4];
    self.tabBar.translucent = YES;
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:TOPCAIL_COLOR, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
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
