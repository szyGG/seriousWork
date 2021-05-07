//
//  TransformViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/26.
//

#define Angle2Randio(angle) ((angle) / 180.0 * M_PI)

#import "TransformViewController.h"
#import "CATrainsitionViewController.h"
#import "CAAnimationGroupController.h"
#import "WheelViewController.h"

@interface TransformViewController ()<CALayerDelegate> {
    NSInteger _a;
    BOOL _isStart;
}

@property (nonatomic ,strong) CALayer *layer;

@property (nonatomic , strong) NSTimer *timer;

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _a = 0;

//    CALayer *layer = [CALayer layer];
//    self.layer = layer;
//    layer.bounds = CGRectMake(0, 0, 100, 100);
//    layer.position = CGPointMake(100, 100);
//   // layer.anchorPoint = CGPointMake(0, 0);//锚点
//  //  layer.frame = CGRectMake(100, 100, 100, 100);
//    layer.backgroundColor = RED_COLOR.CGColor;
//    [self.view.layer addSublayer:layer];
//
   // [self testView];
    
}



//3d旋转
- (void)testView {
    //self.iconView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0);
    //self.iconView.transform = CGAffineTransformMakeRotation(M_PI_4);
    
    self.iconView.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 0);
    self.iconView.layer.transform = CATransform3DMakeTranslation(100, 0, 0);
   // self.iconView.layer.delegate = self;
  //  [self.iconView.layer setNeedsDisplay];
    
}


//添加图层
- (void)addLayer {
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(100, 100);
    layer.anchorPoint = CGPointMake(0, 0);//锚点
  //  layer.frame = CGRectMake(100, 100, 100, 100);
    layer.backgroundColor = RED_COLOR.CGColor;
    [self.view.layer addSublayer:layer];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(time) userInfo:nil repeats:YES];
   // [self testmove];
    
   // [self testScale];
    
    //[self testRotation];
    
   // [self testTransform];
    
    [self shake];
    
  //  [self circle];
}

/**
 
 CAKeyFrameAnimation
 */

//画一个圆的路径进行旋转
- (void)circle {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(100, 100, 200, 200));
    anim.path = path;
    CGPathRelease(path);
    
    //设置动画的执行节奏
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.duration = 3;

    [self.iconView.layer addAnimation:anim forKey:nil];
}


- (void)shake {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.values = @[@(Angle2Randio(-5)),@(Angle2Randio(5)),@(Angle2Randio(-5))];
  //  anim.additive = YES;
    anim.duration = 0.5;
    anim.repeatCount = MAXFLOAT;
    if (!_isStart) {
        [self.iconView.layer addAnimation:anim forKey:@"shake"];
    } else {
        [self.iconView.layer removeAnimationForKey:@"shake"];
    }
    _isStart = !_isStart;
}

/**
 
  CABasicAnimation
 */

- (void)testTransform {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anim.toValue = @(M_PI_2);
    // 设置removedOnCompletion = no fillMode = kCAFillModeForwards
    // 使动画后不会回到原来画面
    anim.duration = 2.0;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:anim forKey:nil];
}

- (void)testRotation {
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    anim.keyPath = @"transform";
    //anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    anim.duration = 2.0;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:anim forKey:@""];
}


//缩放放大
- (void)testScale {
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    anim.keyPath = @"bounds";
    //anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    anim.duration = 2.0;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:anim forKey:@""];
}


- (void)testmove {
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    anim.keyPath = @"position";
    //anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    //toValue :最终变成什么值
    //byValue :在原有的值上增加值
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 600)];
    anim.duration = 2.0;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:anim forKey:@""];
}

- (void)time {
    _a++;
    self.layer.transform = CATransform3DMakeRotation(M_PI_4 * _a, 1, 1, 0);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillDisappear:(BOOL)animated
{
    [self.timer invalidate];
    self.timer = nil;
}


- (IBAction)CATransitions:(id)sender {
    CATrainsitionViewController *vc= [[CATrainsitionViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)CAAnimationGroup:(id)sender {
    CAAnimationGroupController *vc= [[CAAnimationGroupController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)wheel:(id)sender {
    WheelViewController *vc= [[WheelViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
