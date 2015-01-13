//
//  Util.m
//  JKCRM
//
//  Created by Jakey on 14/11/26.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "Util.h"
#import "AppDelegate.h"
@implementation Util
+(MGSplitViewController*)SplitViewController{
    AppDelegate  *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    return app.rootViewController.splitViewController;
}
+(AppDelegate*)APP{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}
@end
