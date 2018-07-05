//
//  FZBaseTabBarViewController.m
//  FangzuiMall
//
//  Created by 吴冰冰 on 2018/7/4.
//  Copyright © 2018年 FangZui. All rights reserved.
//

#import "FZBaseTabBarViewController.h"
#import "FZMainPageViewController.h"
#import "FZMessageMainViewController.h"
#import "FZMainViewController.h"
#import "FZMineViewController.h"
#import "FZBaseNavigationViewController.h"

@interface FZBaseTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation FZBaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    self.delegate = self;
}

- (void)initView {
    
    self.arrMainVCs = @[
                        NSStringFromClass([FZMainPageViewController class]),
                        NSStringFromClass([FZMessageMainViewController class]),
                        NSStringFromClass([FZMainViewController class]),
                        NSStringFromClass([FZMineViewController class]) ];
    
    NSArray*   titleArr = @[
                            @"首页",
                            @"消息",
                            @"方最",
                            @"我的",
                            ];
    NSArray*   selectedImageArr = @[
                                    @"icon_首页select",
                                    @"icon_product_select",
                                    @"icon_消息selected",
                                    @"icon_我的selected",
                                    ];
    NSArray* unselectedImageArr = @[
                                    @"icon_首页",
                                    @"icon_product_unselected",
                                    @"icon_消息",
                                    @"icon_我的",
                                    ];  
    
    for (int i = 0; i < self.arrMainVCs.count; i++) {
        [self addChildViewController:kLoadVcFromClassStringName(_arrMainVCs[i]) title:titleArr[i] finishedSelectedImageName:selectedImageArr[i] finishedUnselectedImage:unselectedImageArr[i] tag:i];
    }
    
    self.tabBar.tintColor = kBlueColor208BEF;
    self.tabBar.translucent = YES;
    [[UITabBar appearance] setBarTintColor:kWhiteColorFFFFFF];
}

/**
 *  创建TabBarController子视图方法
 *
 */
- (void)addChildViewController:(UIViewController*)childController title:(NSString*)title finishedSelectedImageName:(NSString*)finishedSelectedImageName finishedUnselectedImage:(NSString*)finishedUnselectedImage tag:(int)tag
{
    
    childController.title = title;
    childController.tabBarItem.tag = tag;
    childController.tabBarItem.image = [[UIImage imageNamed:finishedUnselectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:finishedSelectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.title = title;
    FZBaseNavigationViewController* nav = [[FZBaseNavigationViewController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    //    [kDefaultNotificationCenter postNotificationName:@"LHDidSelectedTabbarNotification" object:nil];
    
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

#pragma mark - Private Methods


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
}

@end
