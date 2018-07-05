//
//  LHConst.h
//  LiuHeCloudService
//
//  Created by 吴冰冰 on 2018/7/4.
//  Copyright © 2018年 FangZui. All rights reserved.
//
#import <Foundation/Foundation.h>


#ifndef FZConst_h
#define FZConst_h


#define WeakSelf(weakSelf)      __weak __typeof(&*self)    weakSelf  = self;
#define StrongSelf(strongSelf)  __strong __typeof(&*self) strongSelf = weakSelf;

//获取屏幕 宽度、高度 、倍率
#define kScreenBounds [[UIScreen mainScreen] bounds]
#define kScreenWidth kScreenBounds.size.width
#define kScreenHeight kScreenBounds.size.height
#define kScreenScale [UIScreen mainScreen].scale

//版本
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//编译版本
#define kAppBuildVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) //底部tabbar高度
#define kTopHeight (kStatusBarHeight + kNavBarHeight) //整个导航栏高度


#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000 // 当前Xcode支持iOS8及以上

#define SCREEN_WIDTH ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
#define SCREENH_HEIGHT ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
#define SCREEN_SIZE ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale):[UIScreen mainScreen].bounds.size)
#else
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#endif

// 定义使用的打印日志
//#if DEBUG
//#define LHDebugLog(...) NSLog(__VA_ARGS__)
//#define lwkLog(...) LHDebugLog(__VA_ARGS__)
//#define wbbLog(...) LHDebugLog(__VA_ARGS__)
//#else
//#define LHDebugLog(...)
//#endif

//加载viewcontroller，通过类名实例化viewcontroller,只适合带有同名的xib文件或没有xib文件的实例化。
#define kLoadVcFromClassStringName(classStringName) [FZUtils loadVcFromClassStringName:classStringName]

//通知中心
#define kDefaultNotificationCenter [NSNotificationCenter defaultCenter]


//不同屏幕的字体大小缩放控制
#define kFont(size) kScreenWidth > 320 ? (kScreenWidth > 375 ? [UIFont systemFontOfSize:size * 1.2] : [UIFont systemFontOfSize:size * 1.1]):[UIFont systemFontOfSize:size]

//导航栏高度
#define kNavHeight 64

//获得AppDelegate
#define kAppDelegate [[UIApplication sharedApplication] delegate]

#define kBundleId [[NSBundle mainBundle] bundleIdentifier]

///判断是不是iphoneX
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)\
///判断是不是 iOS11
#define IOS11 @available(iOS 11.0, *)

//获取设备宽，高
#define kWindow ([[[UIApplication sharedApplication] delegate] window])

#define kTabarHetght CGRectGetHeight(self.tabBarController.tabBar.frame)
//头部默认高度
#define kTopHeardHeight (110 + (kStabarHetght > 20 ? 30:20))

//适配iphoneX(导航栏高度，状态栏高度，tabbar高度均需动态获取)
#define kNavigationHetght CGRectGetHeight(self.navigationController.navigationBar.frame)
#define kStabarHetght  CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
#define kNavigationAndStabarHegiht (kNavigationHetght + kStabarHetght)
#define kTabarHetght CGRectGetHeight(self.tabBarController.tabBar.frame)

//存取数据
#define kSetNSUser(k, v)                                          \
[[NSUserDefaults standardUserDefaults] setObject:v forKey:k]; \
[[NSUserDefaults standardUserDefaults] synchronize];
#define kGetNSUser(k) [[NSUserDefaults standardUserDefaults] objectForKey:k]
#define kRemoveNSUser(k)                                          \
[[NSUserDefaults standardUserDefaults] removeObjectForKey:k]; \
[[NSUserDefaults standardUserDefaults] synchronize];


#endif /* LHConst_h */
