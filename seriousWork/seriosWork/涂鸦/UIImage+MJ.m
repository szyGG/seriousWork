//
//  UIImage+MJ.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/18.
//

#import "UIImage+MJ.h"

@implementation UIImage (MJ)

+ (instancetype)captureWithView:(UIView *)view
{
    //1.开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    
    //2.将控制器的view的layer渲染到上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    //3.绘制图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //4.结束上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
