//
//  MasterViewController.h
//  JKCRM
//
//  Created by Jakey on 14/11/25.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
@interface MasterViewController : UIViewController
@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) UINavigationController *masterNavigationController;
@property (strong, nonatomic) id masterItem;

@end
