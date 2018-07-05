//
//  UIView+Extension.h
//  Category
//
//  Created by Jellyfish on 16/4/13.
//  Copyright © 2016年 ios-21. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, UIViewCustomBorderType) {
    UIViewCustomBorderTypeNone = 0,
    UIViewCustomBorderTypeTop = 1 << 0,
    UIViewCustomBorderTypeRight = 1 << 1,
    UIViewCustomBorderTypeBottom = 1 << 2,
    UIViewCustomBorderTypeLeft = 1 << 3,
    UIViewCustomBorderTypeAll = UIViewCustomBorderTypeTop | UIViewCustomBorderTypeRight | UIViewCustomBorderTypeBottom | UIViewCustomBorderTypeLeft,
};

@interface UIView (Extension)
/**
 *  此类请在layoutSubviews 或者viewdidLayoutSubViews方法调用
 */
@property (nonatomic) UIViewCustomBorderType customBorderType UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor* customBorderColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) NSNumber *  customBorderLineWidth UI_APPEARANCE_SELECTOR;

@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGSize size;
@property (nonatomic, assign)CGPoint origin;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;

/** 判断self和anotherView是否重叠 */
- (BOOL)intersectsWithAnotherView:(UIView *)anotherView;

@end
