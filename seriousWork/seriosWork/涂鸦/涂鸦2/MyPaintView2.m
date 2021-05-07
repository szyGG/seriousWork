//
//  MyPaintView2.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/18.
//

#import "MyPaintView2.h"

@interface MyPaintView2()

@property (nonatomic ,strong) NSMutableArray *paths;

@property (nonatomic ,strong) UIColor *currentColor; //默认黑

@property (nonatomic ,assign) CGFloat linewidth; //默认1

@end

@implementation MyPaintView2

- (void)awakeFromNib {
    [super awakeFromNib];
    self.currentColor = BLACK_COLOR;
    self.linewidth = 1.0;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.currentColor = BLACK_COLOR;
        self.linewidth = 1.0;
    }
    return self;
}

-(NSMutableArray *)paths
{
    if (!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

//确定起点
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint startPos = [touch locationInView:touch.view];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    [path moveToPoint:startPos];
    [self.paths addObject:path];
    [self setNeedsDisplay];

}


//连线
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  
    UITouch *touch = [touches anyObject];
    CGPoint currentPos = [touch locationInView:touch.view];

    UIBezierPath *path = self.paths.lastObject;
    [path addLineToPoint:currentPos];
    [self setNeedsDisplay];
}


//连线
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
    
}


- (void)drawRect:(CGRect)rect
{
    [self.currentColor set];
    for (UIBezierPath *path in self.paths) {
        path.lineWidth = self.linewidth;
        [path stroke];
    }
}


- (void)clean
{
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}


- (void)back
{
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

- (void)changeColor:(UIColor *)color
{
    self.currentColor = color;
    [self setNeedsDisplay];
}


- (void)changeLineWidth:(CGFloat)width
{
    self.linewidth = width;
    [self setNeedsDisplay];
}

@end
