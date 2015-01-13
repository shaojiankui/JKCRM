//
//  AppDelegate.h
//  JKCRM
//
//  Created by Jakey on 14/11/24.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)  RootViewController *rootViewController;
@property (strong, nonatomic)  UINavigationController *navgationController;
+(AppDelegate*)APP;
@end

