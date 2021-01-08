//
//  UIView+ViewFrameGeometry.h
//  seriousWork
//
//  Created by 史宗运 on 2020/12/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ViewFrameGeometry)
//@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

@property CGFloat x;
@property CGFloat y;

@property CGFloat centerX;

@property CGFloat centerY;


- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

- (void) testFrame;
- (void)setCornerFrame;

- (void)setCornerRadius:(CGFloat)radius;
- (void)setRoundCorner:(UIRectCorner)corner radius:(CGFloat)radius;

//设置单独的边框
- (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width;

/// 更新view的约束级别
- (void)updatePriority:(UILayoutPriority)priority;

/// 移除所有子元素
- (void)removeAllSubviews;

///页面截个图
- (UIImage *)snapshotImage;
@end

NS_ASSUME_NONNULL_END
