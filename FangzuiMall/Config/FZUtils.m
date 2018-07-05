//
//  LHUtils.m
//  LiuHeCloudService
//
///  Created by 吴冰冰 on 2018/7/4.
//  Copyright © 2018年 FangZui. All rights reserved.
//

#import "FZUtils.h"

@implementation FZUtils

+ (NSString*)dateToString:(NSDate*)date
{
    return [self dateToString:date dateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString*)dateToString:(NSDate*)date dateFormat:(NSString*)dateFormat
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:dateFormat];
    NSString* dateString = [dateFormatter stringFromDate:date];
    return dateString;
}
+ (void)showToast:(NSString*)text
{
    [[UIApplication sharedApplication].keyWindow makeToast:text duration:1.f position:CSToastPositionBottom];
}

+ (BOOL)checkObjectInvalid:(id)param
{
    if ((!param) || ([param isEqual:[NSNull null]])) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)checkArrayInvalid:(id)param
{
    if ([self checkObjectInvalid:param] || [param isKindOfClass:[NSArray class]] == NO) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)checkDictionaryInvalid:(id)param
{
    if ([self checkObjectInvalid:param] || [param isKindOfClass:[NSDictionary class]] == NO) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)checkStringInvalid:(NSString*)param
{
    if ((!param) || ([param isEqual:[NSNull null]]) || ([param isKindOfClass:[NSString class]] == NO) || (0 == param.length) || ([param isEqualToString:@"<null>"]) || ([param isEqualToString:@"(null)"])) {
        return YES;
    }
    
    return NO;
}

+ (id)loadVcFromClassStringName:(NSString *)className
{
    if (className)
    {
        NSString *nibFilePath = [[NSBundle mainBundle] pathForResource:className ofType:@"nib"];
        NSString *xibFilePath = [[NSBundle mainBundle] pathForResource:className ofType:@"xib"];
        if (nibFilePath || xibFilePath)
        {
            return [[NSClassFromString(className) alloc] initWithNibName:className bundle:[NSBundle mainBundle]];
        }
        else
        {
            return [[NSClassFromString(className) alloc] init];
        }
    }else
    {
        return [[NSClassFromString(className) alloc] init];
    }
}

+ (CGSize)getSizeOfString:(NSString *)str font:(UIFont *)font
{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 30, 1000) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size;
}

#pragma mark - 找到view所在的控制器
+ (UIViewController*)viewControllerWithView:(UIView*)view
{
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
/**
 *
 *  判断用户输入的密码是否符合规范，符合规范的密码要求：
 1. 长度大于6位小于12位
 2. 密码中必须同时包含数字和字母
 */
+(BOOL)judgePassWordLegal:(NSString *)pass{
    BOOL result = false;
    if ([pass length] >= 6){
        // 判断长度大于8位后再接着判断是否同时包含数字和字符
        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:pass];
    }
    return result;
}
+ (NSString*)decimalNumberFormat:(NSDecimalNumber*)decimalNumber {
    NSNumberFormatter* numberFormat = [[NSNumberFormatter alloc] init];
    [numberFormat setPositiveFormat:@"#0.00"];
    NSString* formatString = [numberFormat stringFromNumber:decimalNumber];
    return formatString;
}
/**
 *
 *  判断用户输入的社会信用代码是否符合规范，符合规范的密码要求：
 1. 长度18位
 2. 包含数字或字母
 */
+(BOOL)judgeCridetNo:(NSString *)cridetNo{
    BOOL result = false;
    NSString * regex = @"^[0-9A-Za-z]{18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    result = [pred evaluateWithObject:cridetNo];
    return result;
}

+ (UIView *)noDataTipWithSuperView:(UIView *)superView tips:(NSString *)tips{
    UIView *vBack = [[UIView alloc]initWithFrame:superView.bounds];
    vBack.backgroundColor = kDefaultVCBackgroundColor;
    CGSize vBackSize = vBack.frame.size;
    UIImageView *ivNotData=[[UIImageView alloc]initWithFrame:CGRectMake(vBackSize.width/2-40, vBackSize.height/4-40, 60, 60)];
    ivNotData.center = vBack.center;
    ivNotData.image=[UIImage imageNamed:@"empty-ico"];
    [vBack addSubview:ivNotData];
    
    UILabel *lbTip=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(ivNotData.frame)+20, vBackSize.width, 40)];
    lbTip.text= tips;
    lbTip.textColor = [UIColor lightGrayColor];
    lbTip.font = [UIFont systemFontOfSize:15];
    lbTip.backgroundColor = [UIColor clearColor];
    lbTip.textAlignment=NSTextAlignmentCenter;
    [vBack addSubview:lbTip];
    
    [superView addSubview:vBack];
    
    return vBack;
}
@end
