//
//  NDColorTool.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import "NDColorTool.h"

@implementation NDColorTool

/**
 点语法 获取平台的字符型号
 */
+ (UIFont *)font:(CGFloat) fontSize
{
    
    return [UIFont systemFontOfSize:fontSize];
    
}

/**
点语法 获取平台的字符型号
*/
+ (UIFont *)boldFont:(CGFloat) fontSize
{
    
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize];
    
}

/**
点语法 获取平台的字符型号
*/
+ (UIFont *)mediumFont:(CGFloat)size{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
    if (!font) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIColor *)colorFrom16RGB:(NSInteger)rgbValue
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
    
}

+ (UIColor *)colorFromRGB:(NSString *)rgbStr
{
    return [NDColorTool colorFromRGBA:[rgbStr stringByAppendingString:@",1.0"]];
}


+ (UIColor *)colorFromRGBA:(NSString *)rgbaStr
{
    NSArray *subArr = [rgbaStr componentsSeparatedByString:@","];
    
    if (subArr.count == 3)
    {
        return [UIColor colorWithRed:[subArr[0] floatValue]/255.0f green:[subArr[1] floatValue]/255.0f blue:[subArr[2] floatValue]/255.0f alpha:1.0];
    }
    else
    {
        return [UIColor colorWithRed:[subArr[0] floatValue]/255.0f green:[subArr[1] floatValue]/255.0f blue:[subArr[2] floatValue]/255.0f alpha:[subArr[3] floatValue]];
    }
}

/**
 点语法 获取平台的颜色
 */
+ (UIColor *)color:(NSString *)key
{
    
    if ([key hasPrefix:@"0x"])
    {
        return UIColorFromRGB([NDColorTool numberWithHexString:key]);
    }
    else
    {
        return [NDColorTool colorFromRGBA:key];
    }
    
    return [UIColor redColor];
    
}


/**
 字符串转16进制Integer
 */
+ (NSInteger)numberWithHexString:(NSString *)hexString{
    
    const char *hexChar = [hexString cStringUsingEncoding:NSUTF8StringEncoding];
    
    int hexNumber;
    
    sscanf(hexChar, "%x", &hexNumber);
    
    return (NSInteger)hexNumber;
}


@end
