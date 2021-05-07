//
//  ToolDefine.h
//  seriousWork
//
//  Created by 史宗运 on 2021/4/17.
//

#ifndef ToolDefine_h
#define ToolDefine_h

#ifndef __OPTIMIZE__
#define IS_DEBUG true
#define NDLog(...) NSLog(__VA_ARGS__)
#else
#define IS_DEBUG false
#define NDLog(...) NSLog(@"")
#endif

#if TARGET_OS_SIMULATOR
#define IS_SIMULATOR true
#else
#define IS_SIMULATOR false
#endif




/********  常用宏  ********/
#define ApplicationVersion [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define USER_DEFAULT                                          [NSUserDefaults standardUserDefaults]
#define NS_NOTIFICATION_CENTER                   [NSNotificationCenter defaultCenter]
#define kNetworkReachabilityStatus [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus
#define IOS(x) ([[[UIDevice currentDevice] systemVersion]floatValue] >= x)
#define isSystem32   sizeof(long) == 4


#endif /* ToolDefine_h */
