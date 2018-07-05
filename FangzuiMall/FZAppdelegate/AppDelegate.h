//
//  AppDelegate.h
//  FangzuiMall
//
//  Created by 吴冰冰 on 2018/7/4.
//  Copyright © 2018年 FangZui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

