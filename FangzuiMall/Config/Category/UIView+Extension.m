//
//  UIView+Extension.m
//  Category
//
//  Created by Jellyfish on 16/4/13.
//  Copyright © 2016年 ios-21. All rights reserved.
//
#define kDefaultViewBorderColor [UIColor colorWithRed:200 / 255.0f green:200 / 255.0f blue:200 / 255.0f alpha:1]
#import "UIView+Extension.h"
#import <objc/runtime.h>

@implementation UIView (Extension)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return  self.frame.size.height;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}

///add right bottom
-(CGFloat)right
{
    return self.x + self.width;
}

-(CGFloat)bottom
{
    return self.y + self.height;
}



/** 判断self和anotherView是否重叠 */
- (BOOL)intersectsWithAnotherView:(UIView *)anotherView
{
    //如果anotherView为nil，那么就代表keyWindow
    if (anotherView == nil) anotherView = [UIApplication sharedApplication].keyWindow;
    // 切换坐标系
    CGRect selfRect = [self convertRect:self.bounds toView:nil];
    CGRect anotherRect = [anotherView convertRect:anotherView.bounds toView:nil];
    //CGRectIntersectsRect是否有交叉
    return CGRectIntersectsRect(selfRect, anotherRect);
}

- (void)setCustomBorderType:(UIViewCustomBorderType)type
{
    CAShapeLayer* borderLayer;
    
    NSString* customBorderKey = NSStringFromSelector(@selector(setCustomBorderType:));
    
    CALayer* layer = [self layer];
    CGRect frame = [self frame];
    
    // non-atomic!
    if (!(borderLayer = [layer valueForKey:customBorderKey])) {
        borderLayer = [CAShapeLayer layer];
        [layer setValue:borderLayer forKey:customBorderKey];
    }
    else {
        [borderLayer removeFromSuperlayer];
        borderLayer = [CAShapeLayer layer];
        [layer setValue:borderLayer forKey:customBorderKey];
    }
    
    UIBezierPath* borderPath = [[UIBezierPath alloc] init];
    
    if (type & UIViewCustomBorderTypeTop) {
        [borderPath moveToPoint:CGPointMake(0.0, 0.0)];
        [borderPath addLineToPoint:CGPointMake(frame.size.width, 0.0)];
    }
    
    if (type & UIViewCustomBorderTypeRight) {
        [borderPath moveToPoint:CGPointMake(frame.size.width, 0.0)];
        [borderPath addLineToPoint:CGPointMake(frame.size.width, frame.size.height)];
    }
    
    if (type & UIViewCustomBorderTypeBottom) {
        [borderPath moveToPoint:CGPointMake(frame.size.width, frame.size.height)];
        [borderPath addLineToPoint:CGPointMake(0.0, frame.size.height)];
    }
    
    if (type & UIViewCustomBorderTypeLeft) {
        [borderPath moveToPoint:CGPointMake(0.0, frame.size.height)];
        [borderPath addLineToPoint:CGPointMake(0.0, 0.0)];
    }
    
    borderLayer.path = [borderPath CGPath];
    borderLayer.strokeColor = [[self customBorderColor] CGColor];
    borderLayer.fillColor = [[UIColor clearColor] CGColor];
    borderLayer.lineWidth = [self customBorderLineWidth].floatValue;
    
    [layer addSublayer:borderLayer];
}

- (UIColor*)customBorderColor
{
    UIColor* color = objc_getAssociatedObject(self, @selector(customBorderColor));
    
    if (color) {
        return color;
    }
    
    return kDefaultViewBorderColor;
}

- (NSNumber *)customBorderLineWidth
{
    
    NSNumber *lineWidth = objc_getAssociatedObject(self, @selector(customBorderLineWidth));
    
    if (lineWidth) {
        return lineWidth;
    }
    
    return @0.5;
}

@end
