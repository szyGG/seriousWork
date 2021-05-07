//
//  ccccViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2021/1/12.
//

#import "ccccViewController.h"

@interface ccccViewController ()

@property (nonatomic , strong) NSString *str;

@end

@implementation ccccViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       // self.hidesBottomBarWhenPushed = YES;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
   // self.hidesBottomBarWhenPushed = YES;
    // Do any additional setup after loading the view.
    [self load:^{
        self.str = @"sda";
    }];
}

- (void)load:(void(^)(void))block {
    block();
}

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)dealloc
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
