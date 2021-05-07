//
//  MyPaintView.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/18.
//

#import "MyPaintView.h"

@interface MyPaintView ()

@property (nonatomic ,strong) NSMutableArray *points;

@property (nonatomic ,strong) NSMutableArray *totalPoints;

@end

@implementation MyPaintView


-(NSMutableArray *)points
{
    if (!_points) {
        _points = [NSMutableArray array];
    }
    return _points;
}

-(NSMutableArray *)totalPoints
{
    if (!_totalPoints) {
        _totalPoints = [NSMutableArray array];
    }
    return _totalPoints;
}

//确定起点
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint startPos = [touch locationInView:touch.view];
    NSMutableArray *path = [NSMutableArray array];
    
    [path addObject:[NSValue valueWithCGPoint:startPos]];
    [self.totalPoints addObject:path];
}


//连线
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSMutableArray *path = self.totalPoints.lastObject;
    UITouch *touch = [touches anyObject];
    CGPoint currentPos = [touch locationInView:touch.view];
    [path addObject:[NSValue valueWithCGPoint:currentPos]];
    [self setNeedsDisplay];
}


//连线
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSMutableArray *path = self.totalPoints.lastObject;
    UITouch *touch = [touches anyObject];
    CGPoint endPos = [touch locationInView:touch.view];
    [path addObject:[NSValue valueWithCGPoint:endPos]];
    [self setNeedsDisplay];
   // [self.points removeAllObjects];
    
}


- (void)drawRect:(CGRect)rect
{
   // UIRectFill(CGRectMake(0, 0, 100, 100));
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
   // CGContextAddLineToPoint(ctx, <#CGFloat x#>, <#CGFloat y#>);
//    NSMutableArray *path = self.totalPoints.lastObject;
    for (NSMutableArray *path in self.totalPoints) {
        for (int i = 0 ; i < path.count ; i++) {
            CGPoint point = [path[i] CGPointValue];
            if (i == 0) {
                CGContextMoveToPoint(ctx, point.x, point.y);
            } else {
                CGContextAddLineToPoint(ctx, point.x, point.y);
            }
        }
    }
    
    //头尾圆滑
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //连接点圆滑
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextSetLineWidth(ctx, 5);
    CGContextStrokePath(ctx);
}


- (void)clean
{
    [self.totalPoints removeAllObjects];
    [self setNeedsDisplay];
}


- (void)back
{
    [self.totalPoints removeLastObject];
    [self setNeedsDisplay];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
