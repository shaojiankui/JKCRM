//
//  UIViewController+Root.m
//  JKCRM
//
//  Created by Jakey on 15/1/7.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIViewController+Root.h"
#import "AppDelegate.h"

@implementation UIViewController (Root)
@dynamic App;
@dynamic RootViewControler;
-(UIViewController *)RootViewControler{
    return [AppDelegate APP].rootViewController;
}
-(AppDelegate *)App{
    return [AppDelegate APP];
}
@end
