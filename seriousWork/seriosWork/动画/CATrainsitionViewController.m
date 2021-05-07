//
//  CATrainsitionViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/28.
//

#import "CATrainsitionViewController.h"

@interface CATrainsitionViewController ()

@property (nonatomic , assign) NSInteger index;

@end

@implementation CATrainsitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)previous:(id)sender {
    self.index--;
    if (self.index == -1) {
        self.index = 6;
    }
    NSString *fileName = [NSString stringWithFormat:@"fj%ld",self.index];
    self.iconView.image = [UIImage imageNamed:fileName];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"pageCurl";
    anim.subtype = kCATransitionFromLeft;
    [self.iconView.layer addAnimation:anim forKey:nil];
}
- (IBAction)next:(id)sender {
    self.index++;
    if (self.index > 6) {
        self.index = 0;
    }
    NSString *fileName = [NSString stringWithFormat:@"fj%ld",self.index];
    self.iconView.image = [UIImage imageNamed:fileName];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"pageCurl";
    anim.subtype = kCATransitionFromRight;
    [self.iconView.layer addAnimation:anim forKey:nil];
    
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
