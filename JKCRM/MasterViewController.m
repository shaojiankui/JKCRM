//
//  MasterViewController.m
//  JKCRM
//
//  Created by Jakey on 14/11/25.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "MasterViewController.h"
#import "Util.h"
@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)setMasterItem:(id)newMasterItem
{
    if (_masterItem != newMasterItem) {
        _masterItem = newMasterItem;
        [self configureView];
    }
}

- (void)configureView
{
    if ([self.masterItem isKindOfClass:[UIViewController class]]) {
        if ([Util SplitViewController].splitWidth==0) {
            return;
        }
        [self.masterNavigationController popToRootViewControllerAnimated:NO];
        [self.masterNavigationController pushViewController:self.masterItem animated:NO];
        [self.masterNavigationController.view setNeedsLayout];
        [self.masterNavigationController.view setNeedsDisplay];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIViewController *empty = [[UIViewController alloc] init];
    empty.view.frame = CGRectMake(0, 0, 250, 768);
    self.masterNavigationController = [[UINavigationController alloc] initWithRootViewController:empty];
    self.masterNavigationController.navigationBarHidden = YES;
    [self.view addSubview:self.masterNavigationController.view];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.masterNavigationController.view.frame = CGRectMake(0, 0, 250, 768);
    [self.masterNavigationController.view setNeedsLayout];
    [self.masterNavigationController.view setNeedsDisplay];
}


@end
