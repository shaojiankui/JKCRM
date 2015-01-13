//
//  BaseMasterViewController.h
//  JKCRM
//
//  Created by Jakey on 14/11/26.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LightDataSource.h"
#import "LightDelegate.h"
#import "LightCell.h"
#import "DetailViewController.h"
@interface BaseMasterViewController : UIViewController
@property (strong, nonatomic) DetailViewController *detailViewController;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) LightDataSource *dataSource;
@property (nonatomic, strong) LightDelegate *delegate;
@property (nonatomic, strong) NSArray *dataList;

@property (strong, nonatomic)  UIButton *addButton;

-(void)presentController:(UIViewController*)controller;

@end
