//
//  SeriousHeader.h
//  seriousWork
//
//  Created by 史宗运 on 2020/12/28.
//

#ifndef SeriousHeader_h
#define SeriousHeader_h

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

#define SYSTEM_NUMBER [[[UIDevice currentDevice] systemVersion] floatValue]


//导航栏高度
#define NAVIGATOR_HEIGHT ((IS_IPHONE_X ||IS_IPHONE_XR || IS_IPHONE_XS_MAX) ? 88.0f : 64.0f)

//iPhone 虚拟home键的高度
#define HOMEBAR_HEIGHT ((IS_IPHONE_X ||IS_IPHONE_XR || IS_IPHONE_XS_MAX) ? 34.0f : 0.0f)

//UITabbarViewController
#define TABBAR_HEIGHT ((IS_IPHONE_X ||IS_IPHONE_XR || IS_IPHONE_XS_MAX) ? 83.0f : 49.0f)

//状态栏高度
#define STATUSBAR_HEIGHT ((IS_IPHONE_X ||IS_IPHONE_XR || IS_IPHONE_XS_MAX) ? 44.0f : 20.0f)

//keywindow上全屏遮罩的ViewTag
#define KeyWindow_ViewTag  99

/********  常用宏  ********/
#define IOS7STATUS ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0?20.0:0.0)
#define IS_IPHONE_4 (( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )480) < DBL_EPSILON ))
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_6 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )667 ) < DBL_EPSILON )
#define IS_IPHONE_6_PLUS ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )736 ) < DBL_EPSILON )
#define IS_IPHONE_X ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )812 ) < DBL_EPSILON )
#define IS_IPHONE_XR ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )896 ) < DBL_EPSILON )
#define IS_IPHONE_XS_MAX ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )896 ) < DBL_EPSILON )

//iOS11 解决pop和push抖动问题的宏
#define TableViewInsetNever(tableView) if([[[UIDevice currentDevice] systemVersion]floatValue]>=11.0) {tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;}

#define NDWeakObj(o) @autoreleasepool { }__weak typeof(o) o##Weak = o;
#define NDStrongObj(o) @autoreleasepool {} __strong typeof(o) o = o##Weak;

#define NDSafeBlock(BlockName, ...) ({ !BlockName ? nil : BlockName(__VA_ARGS__); })

#define ImageName(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

/* 遮罩需要移除的通知 */
static NSNotificationName NDMaskNeedRemoveNotification = @"NDMaskNeedRemoveNotification";

#endif /* SeriousHeader_h */
