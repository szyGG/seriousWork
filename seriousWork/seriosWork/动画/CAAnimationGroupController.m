//
//  CAAnimationGroupController.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/28.
//

#import "CAAnimationGroupController.h"

@interface CAAnimationGroupController ()

@end

@implementation CAAnimationGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:2.0 animations:^{

        self.iconView.y = 400;
    }];
}

//动画组
- (void)groupAnimation
{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    // 1.创建旋转动画对象
    CABasicAnimation *rotate = [CABasicAnimation animation];
    rotate.keyPath = @"transform.rotation";
    rotate.toValue = @(M_PI);

    
    // 1.创建缩放动画对象
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.toValue = @(0.0);
    
    // 1.创建平移动画对象
    CABasicAnimation *move = [CABasicAnimation animation];
    move.keyPath = @"transform.translation";
    move.toValue =[NSValue valueWithCGPoint:CGPointMake(300, 400)];

    group.animations = @[rotate,scale,move];
    
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.duration = 2.0;
    

    [self.iconView.layer addAnimation:group forKey:nil];
}

@end
