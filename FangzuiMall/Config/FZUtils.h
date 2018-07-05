//
//  LHUtils.h
//  LiuHeCloudService
//
//  Created by 吴冰冰 on 2018/7/4.
//  Copyright © 2018年 FangZui. All rights reserved.
//

/*
  此处存放公共方法，常用工具类
 */

#import <Foundation/Foundation.h>
#import "UIView+Toast.h"

@interface FZUtils : NSObject

/**
 *    NSDate 转换为字符串格式：yyyy-MM-dd HH:mm:ss
 *
 *    @param     date     要转换的NSDate
 *
 *    @return yyyy-MM-dd HH:mm:ss 格式的字符串时间
 */
+ (NSString*)dateToString:(NSDate*)date;

/**
 *    NSDate 转换为字符串格式
 *
 *    @param     date     要转换的NSDate
 *    @param     dateFormat     格式的字符串，如：yyyy-MM-dd HH:mm:ss 、yyyy-MM-dd
 *
 *    @return    格式化后的时间字符串
 */
+ (NSString*)dateToString:(NSDate*)date dateFormat:(NSString*)dateFormat;

/**
 *  吐司
 *
 *  @param text 提示信息
 */
+ (void)showToast:(NSString*)text;

+ (BOOL)checkObjectInvalid:(id)param;

+ (BOOL)checkArrayInvalid:(id)param;

+ (BOOL)checkDictionaryInvalid:(id)param;

// 字符串为空判断，非法返回真
+ (BOOL)checkStringInvalid:(NSString*)param;

/**
 *    通过类名实例化viewcontroller,只适合带有同名的xib文件或没有xib文件的实例化。
 *
 *    @param     className     类名（string）
 *
 *    @return    创建好的viewcontroller
 */
+ (id)loadVcFromClassStringName:(NSString *)className;

/**
 *    默认对(screenWidth,1000) 范围内计算str包括换行后的高度
 *
 *    @param     str     需要计算的文本
 *               font    字体
 *
 *    @return    字符高度
 */
+ (CGSize)getSizeOfString:(NSString *)str font:(UIFont *)font;
/**
 *  找到view所在的控制器
 *
 *  @param view 视图
 *
 *  @return 控制器
 */
+ (UIViewController*)viewControllerWithView:(UIView *)view;

/**
*
*  判断用户输入的密码是否符合规范，符合规范的密码要求：
1. 长度大于6位小于12位
2. 密码中必须同时包含数字和字母
*/
+(BOOL)judgePassWordLegal:(NSString *)pass;

/**
 格式化decimalNumber类型
 @param decimalNumber 传入一个decimalNumber对象
 @return 一个保留小数点后两位的字符串
 */
+ (NSString*)decimalNumberFormat:(NSDecimalNumber*)decimalNumber;

/**
 *
 *  判断用户输入的社会信用代码是否符合规范，符合规范的密码要求：
 1. 长度18位
 2. 包含数字或字母
 */
+(BOOL)judgeCridetNo:(NSString *)cridetNo;

+ (UIView *)noDataTipWithSuperView:(UIView *)superView tips:(NSString *)tips;

@end
