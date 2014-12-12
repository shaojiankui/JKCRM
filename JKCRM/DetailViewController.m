//
//  DetailViewController.m
//  JKCRM
//
//  Created by Jakey on 14/11/25.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "DetailViewController.h"
#import "Util.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
    }
}

- (void)configureView
{
    if ([self.detailItem isKindOfClass:[UIViewController class]]) {
        [self.detailNavigationController popToRootViewControllerAnimated:NO];
        BOOL animate = YES;
        if ([Util SplitViewController].splitWidth==0) {
            animate = NO;
            self.detailNavigationController.view.frame = CGRectMake(0, 0, 916, 768);

        }else{
            self.detailNavigationController.view.frame = CGRectMake(0, 0, 662, 768);
        }
        [self.detailNavigationController pushViewController:self.detailItem animated:animate];
    }
    if (self.detailItem == nil) {
        [self.detailNavigationController popToRootViewControllerAnimated:NO];
    }
    
    [self.detailNavigationController.view setNeedsLayout];
    [self.detailNavigationController.view setNeedsDisplay];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIViewController *empty = [[UIViewController alloc] init];
    empty.view.frame = CGRectMake(0, 0, 662, 768);
    self.detailNavigationController = [[UINavigationController alloc] initWithRootViewController:empty];
    self.detailNavigationController.navigationBarHidden = YES;
    [self.view addSubview:self.detailNavigationController.view];
    self.detailNavigationController.view.autoresizingMask = UIViewAutoresizingNone;
    self.detailNavigationController.view.frame = CGRectMake(0, 0, 662, 768);
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.detailNavigationController.view.autoresizingMask = UIViewAutoresizingNone;
    self.detailNavigationController.view.frame = CGRectMake(0, 0, 662, 768);
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animate{
    self.waitNavigation = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
