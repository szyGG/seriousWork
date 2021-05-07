//
//  UIView+ViewFrameGeometry.m
//  seriousWork
//
//  Created by 史宗运 on 2020/12/28.
//

#import "UIView+ViewFrameGeometry.h"

@implementation UIView (ViewFrameGeometry)
// Retrieve and set the origin
- (CGPoint) origin
{
    return self.frame.origin;
}

- (void) setOrigin: (CGPoint) aPoint
{
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame = newframe;
}


// Retrieve and set the size
- (CGSize) size
{
    return self.frame.size;
}

- (void) setSize: (CGSize) aSize
{
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}

// Query other frame locations
- (CGPoint) bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint) bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint) topRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}


// Retrieve and set height, width, top, bottom, left, right
- (CGFloat) height
{
    return self.frame.size.height;
}

- (void) setHeight: (CGFloat) newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat) width
{
    return self.frame.size.width;
}

- (void) setWidth: (CGFloat) newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (CGFloat) top
{
    return self.frame.origin.y;
}

- (void) setTop: (CGFloat) newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat) left
{
    return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat) bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void) setBottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat) right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void) setRight: (CGFloat) newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}


- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect newframe = self.frame;
    newframe.origin.x = x;
    self.frame = newframe;
    
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    CGRect newframe = self.frame;
    newframe.origin.y = y;
    self.frame = newframe;
    
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    
    center.x = centerX;
    
    self.center = center;
}


- (CGFloat)centerY
{
    return self.center.y;
    
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    
    center.y = centerY;
    
    self.center = center;
}


// Move via offset
- (void) moveBy: (CGPoint) delta
{
    CGPoint newcenter = self.center;
    newcenter.x += delta.x;
    newcenter.y += delta.y;
    self.center = newcenter;
}

// Scaling
- (void) scaleBy: (CGFloat) scaleFactor
{
    CGRect newframe = self.frame;
    newframe.size.width *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame = newframe;
}

// Ensure that both dimensions fit within the given size by scaling down
- (void) fitInSize: (CGSize) aSize
{
    CGFloat scale;
    CGRect newframe = self.frame;
    
    if (newframe.size.height && (newframe.size.height > aSize.height))
    {
        scale = aSize.height / newframe.size.height;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    if (newframe.size.width && (newframe.size.width >= aSize.width))
    {
        scale = aSize.width / newframe.size.width;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    self.frame = newframe;
}

- (void)testFrame
{
    self.layer.borderWidth = 2.0f;
    self.layer.borderColor = [UIColor redColor].CGColor;
}

- (void)setCornerFrame
{
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:5.0];
}

- (void)setCornerRadius:(CGFloat)radius
{
    [self.layer setCornerRadius:radius];
    
    [self.layer setMasksToBounds:YES];
}

- (void)setRoundCorner:(UIRectCorner)corner radius:(CGFloat)radius {
    CGRect roundRect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundRect byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = roundRect;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

//设置单独的边框
- (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width{
    if (top) {
           CALayer *layer = [CALayer layer];
           layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
           layer.backgroundColor = color.CGColor;
           [view.layer addSublayer:layer];
    }
    if (left) {
       CALayer *layer = [CALayer layer];
       layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
       layer.backgroundColor = color.CGColor;
       [view.layer addSublayer:layer];
    }
    if (bottom) {
       CALayer *layer = [CALayer layer];
       layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
       layer.backgroundColor = color.CGColor;
       [view.layer addSublayer:layer];
    }
    if (right) {
       CALayer *layer = [CALayer layer];
       layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
       layer.backgroundColor = color.CGColor;
       [view.layer addSublayer:layer];
    }
}

/// 移除所有子元素
- (void)removeAllSubviews {
    
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

/// 更新view的约束级别
- (void)updatePriority:(UILayoutPriority)priority
{
    [self setContentHuggingPriority:priority forAxis:UILayoutConstraintAxisHorizontal];
    [self setContentCompressionResistancePriority:priority forAxis:UILayoutConstraintAxisHorizontal];
    [self setContentHuggingPriority:priority forAxis:UILayoutConstraintAxisVertical];
    [self setContentCompressionResistancePriority:priority forAxis:UILayoutConstraintAxisVertical];
}

- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}
@end
