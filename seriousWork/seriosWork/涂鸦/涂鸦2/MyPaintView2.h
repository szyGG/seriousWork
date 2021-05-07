//
//  MyPaintView2.h
//  seriousWork
//
//  Created by 史宗运 on 2021/4/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyPaintView2 : UIView

- (void)clean;

- (void)back;

- (void)changeColor:(UIColor *)color;

- (void)changeLineWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
