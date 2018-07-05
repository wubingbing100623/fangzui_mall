//
//  FZBaseNavigationViewController.m
//  FangzuiMall
//
//  Created by 吴冰冰 on 2018/7/4.
//  Copyright © 2018年 FangZui. All rights reserved.
//

#import "FZBaseNavigationViewController.h"

@interface FZBaseNavigationViewController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, weak) UIViewController* showingVC;
@end

@implementation FZBaseNavigationViewController

+ (void)initialize
{
    [super initialize];
    
    //设置Navigation颜色
    [[UINavigationBar appearance] setBarTintColor:kBlackColor1A1F26];
    
  NSDictionary* textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    kYellowColorD7B381, NSForegroundColorAttributeName,
                                    [UIFont systemFontOfSize:18.0f], NSFontAttributeName,
                                    nil];
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributes];
}


- (instancetype)initWithRootViewController:(UIViewController*)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        self.navigationBar.translucent = NO;
        self.interactivePopGestureRecognizer.delegate = self;
        self.delegate = self;
    }
    return self;
}

- (UIBarButtonItem*)createBackButton
{
    UIImage* image = [UIImage imageNamed:@"nav_icon_return"];
    CGRect backframe = CGRectMake(0, 0, 11, 16);
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = backframe;
    [backButton setBackgroundImage:image forState:UIControlStateNormal];
    [backButton setTitle:@"" forState:UIControlStateNormal];
//    [backButton setEnlargEdgeWithTop:20 right:20 bottom:20 left:20];
    [backButton addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* someBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    return someBarButtonItem;
}

- (void)popself
{
    [self popViewControllerAnimated:NO];
}

- (void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        viewController.navigationItem.leftBarButtonItem = [self createBackButton];
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = NO;
    }
    
    //设置透明偏移
    if ([viewController respondsToSelector:@selector(edgesForExtendedLayout)]) {
        viewController.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [super pushViewController:viewController animated:animated];
    
}

- (void)navigationController:(UINavigationController*)navigationController didShowViewController:(UIViewController*)viewController animated:(BOOL)animated
{
    
    /**rootViewController不需要滑动手势，设置为nil*/
    if (navigationController.viewControllers.count == 1) {
        self.showingVC = nil;
    }
    else {
        self.showingVC = viewController;
    }
}

/**
 *  只有完成了pop操作之后，视图已经完全显示，手势才能够重新识别
 *
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        return (self.showingVC == self.topViewController);
    }
    return YES;
}


@end
