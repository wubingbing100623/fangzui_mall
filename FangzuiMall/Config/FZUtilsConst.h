//
//  FZUtilsConst.h
//
//  Created by wubingbing on 18/3/1.
/*
   此处用来存放常量
 */

#import <UIKit/UIKit.h>
#import "UIColor+HEX.h"

/*
 例如：
 //用于第一次判断当前版本的Key
 FOUNDATION_EXPORT NSString* const LHVersionKey;
 */

//带有RGBA的颜色设置
#define kColor(R, G, B, A) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:A]
// 获取RGB颜色
#define kRGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a]
#define kRGB(r, g, b) RGBA(r, g, b, 1.0f)

//默认控制器的背景色
#define kDefaultVCBackgroundColor kRGBA(240, 240, 240, 1)
#define kRedColor [UIColor colorWithHexString:@"#e50012"]
#define kGaryColor [UIColor colorWithHexString:@"#999999"]
#define kTextGaryColor [UIColor colorWithHexString:@"#666666"]
#define kBlueColor [UIColor colorWithHexString:@"#0a59c2"]
#define kBlackColor1A1F26 [UIColor colorWithHexString:@"#1A1F26"]
#define kWhiteColorFFFFFF [UIColor colorWithHexString:@"#FFFFFF"]
#define kGaryColorD4D4D4 [UIColor colorWithHexString:@"#D4D4D4"]
#define kGaryColorF4F4F4 [UIColor colorWithHexString:@"#F4F4F4"]
#define kGaryColorDDDDDD [UIColor colorWithHexString:@"#DDDDDD"]
#define kGaryColor333333 [UIColor colorWithHexString:@"#333333"]
#define kGaryColor666666 [UIColor colorWithHexString:@"#666666"]
#define kGaryColor999999 [UIColor colorWithHexString:@"#999999"]
#define kYellowColorFE9E25 [UIColor colorWithHexString:@"#FE9E25"]
#define kBlueColor208BEF [UIColor colorWithHexString:@"#208BEF"]
#define kBlueColorE7F3FD [UIColor colorWithHexString:@"#E7F3FD"]
#define kGaryColor9B9B9B [UIColor colorWithHexString:@"#9B9B9B"]
#define kGaryColorBBBBBB [UIColor colorWithHexString:@"#BBBBBB"]
#define kGaryColorCCCCCC [UIColor colorWithHexString:@"#CCCCCC"]
#define kRedColorEB4B3E [UIColor colorWithHexString:@"#EB4B3E"]
#define kYellowColorD7B381 [UIColor colorWithHexString:@"#D7B381"]
#define kYellowColorECB64D  [UIColor colorWithHexString:@"#ECB64D"]
#define kWhiteColorF8F8F8 [UIColor colorWithHexString:@"#F8F8F8"]
#define kWhiteColorF3ECE1 [UIColor colorWithHexString:@"#F3ECE1"]
#define kGreenColor58D89C [UIColor colorWithHexString:@"#58D89C"]
#define kBlueColor43ACEC [UIColor colorWithHexString:@"#43ACEC"]
#define kBlueColorE8F4FF [UIColor colorWithHexString:@"#E8F4FF"]
#define kBlueColorF4FAFF [UIColor colorWithHexString:@"#F4FAFF"]
#define kRedColorFFE8E2 [UIColor colorWithHexString:@"#FFE8E2"]
#define kYellowColorFEF8E3  [UIColor colorWithHexString:@"#FEF8E3"]
#define kBlueColorDDF0FE  [UIColor colorWithHexString:@"#DDF0FE"]
#define kYellowColorFEF7EE  [UIColor colorWithHexString:@"#FEF7EE"]
#define kGreenColorE3F7FF  [UIColor colorWithHexString:@"#E3F7FF"]
#define kYellowColorD7B381  [UIColor colorWithHexString:@"#D7B381"]
#define kRedColorFC857E [UIColor colorWithHexString:@"#FC857E"]
#define kBlueColor68A3F8  [UIColor colorWithHexString:@"#68A3F8"]
#define kYellowColorFEA666  [UIColor colorWithHexString:@"#FEA666"]
#define kBlueColor37BBEF  [UIColor colorWithHexString:@"#37BBEF"]
#define kGaryColorF3F3F3 [UIColor colorWithHexString:@"#F3F3F3"]
#define kGaryColorF2F2F2 [UIColor colorWithHexString:@"#F2F2F2"]
#define kGaryColorF5F5F5 [UIColor colorWithHexString:@"#F5F5F5"]
#define kOrangeColorFB6021 [UIColor colorWithHexString:@"#FB6021"]
#define kBlueColor017CFF [UIColor colorWithHexString:@"#017CFF"]
#define kGaryColor1E2227 [UIColor colorWithHexString:@"#1E2227"]
#define kBlackColor1D2228 [UIColor colorWithHexString:@"#1D2228"]
#define kGaryColorF5F7F9 [UIColor colorWithHexString:@"#F5F7F9"]


