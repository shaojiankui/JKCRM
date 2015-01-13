//
//  SaleCell.h
//  JKCRM
//
//  Created by Jakey on 14/12/1.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *mobile;
- (void)configureCellData:(NSDictionary *)item;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@end
