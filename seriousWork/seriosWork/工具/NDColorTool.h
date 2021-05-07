//
//  NDColorTool.h
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import <Foundation/Foundation.h>
#import "NDUIConfig.h"

/**
 系统字体获取
 @param fontSize 字体号
 */
#define FONT(fontSize) [NDColorTool font:(fontSize)]

 /**
 加粗系统字体获取
 @param fontSize 字体号
 */
#define FONT_BOLD(fontSize)  [NDColorTool boldFont:(fontSize)]

 /**
苹方Medium字体获取, tip:在ios9.0以上使用,ios9.0以下使用系统默认字体
 @param fontSize 字体号
 */
#define FONT_Medium(fontSize)  [NDColorTool mediumFont:(fontSize)]

/**
 颜色获取
 @param 颜色字符串 支持 255,255,255,1.0 或 0xb2bffb
 */
#define COLOR(KEY) [NDColorTool color:(KEY)]




#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBCOLOR(r,g,b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define RGBA(a, b, c, d) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:d]


////导航栏 上 按钮文字的颜色
#define NAV_BAR_TEXT_COLOR [NDUIConfig shareInstance].navigaBarTextColor
//
////导航栏颜色
#define  NAV_BAR_COLOR [NDUIConfig shareInstance].navigaBarColor

#define GUIDE_BG_COLOR RGBA(0, 0, 0, 0.6f)

#define MASK_BG_COLOR RGBA(0, 0, 0, 0.2f)

//字体颜色
#define WHITE_COLOR COLOR(@"255,255,255")

//蓝色 不可点击
#define BLUE_DISABLE COLOR(@"0xb2bffb")

//平台主题色
#define TOPCAIL_COLOR  [NDUIConfig shareInstance].topicClolor

//淡蓝色
#define LIGHT_BLUE_COLOR COLOR(@"0x7cb7ff")

//渐变色 - 高
#define HIGH_COLOR  COLOR(@"0x49b9f3")
//渐变色 - 低
#define LOW_COLOR COLOR(@"0x4789f7")

//女标签颜色渐变值 - 高
#define GIRL_HIGH_COLOR  COLOR(@"0xd767d6")
//女标签颜色渐变值 - 低
#define GIRL_LOW_COLOR COLOR(@"0xb558d0")


//黄色渐变 - 高
#define YELLOW_HIGH_COLOR COLOR(@"0xffc66d")
//黄色渐变 - 低
#define YELLOW_LOW_COLOR COLOR(@"0xffa019")

//淡蓝色渐变 - 高
#define LIGHTBLUE_HIGH_COLOR COLOR(@"0x60c8fe")
//淡蓝色渐变 - 低
#define LIGHTBLUE_LOW_COLOR COLOR(@"0x47aff7")

//积分界面我要兑换色值 - 高
#define INCOME_HIGH_COLOR COLOR(@"0x489bf5")
//积分界面我要兑换色值 - 低
#define INCOME_LOW_COLOR COLOR(@"0x477ff7")


//通用透明度
#define COMMON_ALPHA 0.6

#define ZHUAN_COLOR COLOR(@"0x42d049")
#define HEIP_COLOR COLOR(@"0x60cfbd")
//背景底色
#define BACKGROUND_COLOR [NDUIConfig shareInstance].backgroundCololr
#define BLACK_COLOR [UIColor blackColor]
#define RED_COLOR  COLOR(@"252,119,56")
#define YELLOW_COLOR  COLOR(@"0xfba91e")
#define HIGHTLIGHTED_COLOR  COLOR(@"0xff950c")
#define LINE_COLOR    COLOR(@"0xf5f5f5")
#define PURE_COLOR COLOR(@"114,54,207")
#define SEPARATORLINE_COLOR COLOR(@"221, 221, 221")
#define GRAY_COLOR [UIColor lightGrayColor]

//headerView 底色
#define HEADERVIEW_COLOR COLOR(@"0xFFF6E7")




//字体颜色
//  TEXT_COLOR_1  = 0x222222
#define TEXT_COLOR_1 [NDUIConfig shareInstance].titleColor

#define TEXT_COLOR_2 COLOR(@"0x969696")

// TEXT_COLOR_3 = 0x818181
#define TEXT_COLOR_3 [NDUIConfig shareInstance].detailColor

#define TEXT_COLOR_4 COLOR(@"0xdddddd")

#define TEXT_COLOR_5 COLOR(@"0x4f5356")

#define TEXT_COLOR_6 COLOR(@"0xcbcaca")

#define TEXT_COLOR_ORANGE COLOR(@"0xffa019")

#define Text_COLOR_HIGHORANGE COLOR(@"0xffc66d")

#define TEXT_COLOR_8 COLOR(@"0x476df7")

#define TEXT_COLOR_C2C2 COLOR(@"0xC2C2C2")

#define TEXT_COLOR_FF8026 COLOR(@"0xFF8026")

#define TEXT_COLOR_FAA849 COLOR(@"0xFAA849")

//底部按钮颜色 TEXT_COLOR_7 = 0x323232
#define TEXT_COLOR_7 [NDUIConfig shareInstance].barBtnLabelColor

#define TEXT_COLOR_FF8181 UIColorFromRGB(0x818181)

#define TEXT_COLOR_999 COLOR(@"0x999999")

//字体大小
#define TEXT_FONT_21  FONT(21)

#define TEXT_FONT_20  FONT(20)

#define TITLE_FONT_19  FONT(19) //用于标题大小 会更改暂时不要用

#define TEXT_FONT_18  FONT(18)

#define TEXT_FONT_17  FONT(17)

#define TEXT_FONT_16  [NDUIConfig shareInstance].barBtnLabelFont

#define TEXT_FONT_15  [NDUIConfig shareInstance].titleFont

#define TEXT_FONT_14  FONT(14)

#define TEXT_FONT_13  [NDUIConfig shareInstance].detailFont

#define TEXT_FONT_12  FONT(12)

#define TEXT_FONT_11  FONT(11)

#define TEXT_FONT_10  FONT(10)




//绿色 选中
//#define GREEN_SELECTED UIColorFromRGB(0xa0f4e7)
//#define GREEN_UN_SELECTED UIColorFromRGB(0xc1f6ee)
//灰色 为选中
#define GRAY_UN_SELECTED COLOR(@"0xDDDDDD")

//绿色 按钮高亮
#define GREEN_HIGHLIGHTED COLOR(@"0x40b6a4")

//首页发送验证码置灰按钮
#define VERIFTY_COLOR COLOR(@"0xd4d8d9")



//标签蓝色
#define LABEL_BLUE COLOR(@"0x66CCFF")
#define LABEL_PURPLE COLOR(@"0xC41DAE")
#define LABEL_GREEN COLOR(@"0x4CD8C3")

//纸张黄色
#define PAPER_Yellow COLOR(@"255,250,243")

@interface NDColorTool : NSObject


/**
 点语法 获取平台的字符型号
 */
+ (UIFont *)font:(CGFloat) fontSize;

/**
点语法 获取平台的字符型号
*/
+ (UIFont *)boldFont:(CGFloat) fontSize;

/**
点语法 获取平台的字符型号
*/
+ (UIFont *)mediumFont:(CGFloat)size;

/**
 点语法 获取平台的颜色
 */
+ (UIColor *)color:(NSString *)key;


@end
