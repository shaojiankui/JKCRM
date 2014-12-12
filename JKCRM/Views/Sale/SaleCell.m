//
//  SaleCell.m
//  JKCRM
//
//  Created by Jakey on 14/12/1.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "SaleCell.h"

@implementation SaleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configureCellData:(NSDictionary *)item
{
    self.name.text = [item objectForKey:@"saleName"];
    self.mobile.text = [item objectForKey:@"saleMobile"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
