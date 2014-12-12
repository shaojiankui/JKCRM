//
//  SaleDetailViewController.h
//  JKCRM
//
//  Created by Jakey on 14/11/27.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "BaseDetailViewController.h"
#import "Sale.h"
@interface SaleDetailViewController : BaseDetailViewController
@property (nonatomic,strong) Sale *sale;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@end
