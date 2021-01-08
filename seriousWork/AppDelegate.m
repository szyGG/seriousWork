//
//  AppDelegate.m
//  seriousWork
//
//  Created by 史宗运 on 2020/12/28.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    MainViewController *vc = [[MainViewController alloc] init];
    self.window.rootViewController = vc;
    return YES;
}




@end
