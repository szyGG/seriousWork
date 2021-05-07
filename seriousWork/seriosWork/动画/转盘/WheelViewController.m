//
//  WheelViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/28.
//

#import "WheelViewController.h"
#import "Wheel.h"

@interface WheelViewController ()

@property (nonatomic ,strong) Wheel *wheel;

@end

@implementation WheelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wheel = [[Wheel alloc] init];
    [self.view addSubview:self.wheel];
    self.wheel.center = CGPointMake(SCREEN_WIDTH * 0.5 , self.view.height * 0.5);
   
}


- (IBAction)startRotation:(id)sender {
    [self.wheel startRotating];
}


- (IBAction)stopRotation:(id)sender {
    [self.wheel stopRotating];
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
