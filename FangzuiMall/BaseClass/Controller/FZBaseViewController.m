//
//  FZBaseViewController.m
//  FangzuiMall
//
//  Created by 吴冰冰 on 2018/7/4.
//  Copyright © 2018年 FangZui. All rights reserved.
//

#import "FZBaseViewController.h"

@interface FZBaseViewController ()

@end

@implementation FZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//self.view.backgroundColor = kDefaultVCBackgroundColor;
    //    self.navigationController.navigationBar.translucent = NO;//设置导航栏为不是半透明状态
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    
    //    //以下两行代码根据需要设置
    //    self.edgesForExtendedLayout = NO;
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    //    // 设置CGRectZero从导航栏下开始计算
    //    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
    //        self.edgesForExtendedLayout =UIRectEdgeNone;
    //    }
    //
    //    if (self.navigationController.navigationBar.hidden == YES) {
    //        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT + kTopHeight);
    //    }
}

@end
