//
//  RootViewController.h
//  JKCRM
//
//  Created by Jakey on 14/11/24.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGSplitViewController.h"
#import "MasterViewController.h"
#import "DetailViewController.h"


@interface RootViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,MGSplitViewControllerDelegate>
{
    NSArray *_menuList;
}
@property (weak, nonatomic) IBOutlet UICollectionView *menuView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, strong)  MGSplitViewController *splitViewController;
@property (nonatomic, strong)  MasterViewController *masterViewController;
@property (nonatomic, retain)  DetailViewController *detailViewController;
@end
