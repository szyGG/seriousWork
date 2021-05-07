//
//  Wheel.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/28.
//

#import "Wheel.h"

@interface Wheel()<CAAnimationDelegate>

@property (nonatomic ,strong) UIButton *selectBtn;

@property (nonatomic ,strong) CADisplayLink *link;

@end

@implementation Wheel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"Wheel" owner:nil options:nil].lastObject;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backView.userInteractionEnabled = YES;
    for (int i = 0; i < 10; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
       // btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
        [self.backView addSubview:btn];
        btn.bounds = CGRectMake(0, 0, 78, 150);
        [btn setBackgroundImage:[UIImage imageNamed:@"message_select"] forState:UIControlStateSelected];
        btn.layer.position = CGPointMake(self.backView.width / 2.0, self.backView.height / 2.0);
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.transform = CGAffineTransformMakeRotation((36 * i) / 180.0 * M_PI);
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchDown];
        btn.tag = i;
    }
}


-(void)startRotating
{
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//    anim.toValue = @(2 * M_PI);
//    anim.repeatCount = MAXFLOAT;
//    anim.duration = 5.0;
//    [self.backView.layer addAnimation:anim forKey:nil];
    if (!self.link) {
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        self.link = link;
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    
}


- (void)stopRotating
{
    [self.link invalidate];
    self.link = nil;
}


- (void)update
{
    self.backView.transform = CGAffineTransformRotate(self.backView.transform, M_PI/100);
}


- (IBAction)startChou:(id)sender {
    self.userInteractionEnabled = NO;
    [self stopRotating];
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anim.toValue = @(M_PI * 6);
    anim.duration = 1.5;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.delegate = self;
    [self.backView.layer addAnimation:anim forKey:nil];
}


- (void)btnclick:(UIButton *)btn{
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
    NSLog(@"%ld",btn.tag);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.userInteractionEnabled = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startRotating];
    });
}

@end
