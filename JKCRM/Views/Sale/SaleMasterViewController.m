//
//  SaleMasterViewController.m
//  JKCRM
//
//  Created by Jakey on 14/11/27.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "SaleMasterViewController.h"
#import "Sale.h"
#import "SaleDetailViewController.h"
#import "SaleCell.h"
#import "SaleEditViewController.h"
@interface SaleMasterViewController ()

@end

@implementation SaleMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataList = [NSArray array];
    [self buildTableView];
    [self loadData];
    
    __block typeof(self) weakSelf = self;
    [self.addButton addActionHandler:^(NSInteger tag) {
        [weakSelf presentADD];
    }];

    
}
-(void)presentADD{
    SaleEditViewController *add = [[SaleEditViewController alloc]init];
    [add didDoneActionBlock:^{
        [self loadData];
    }];
    [add didCancleActionBlock:^{
        
    }];
    [self presentController:add];
}


-(void)loadData{
    [Sale getSaleList:@{} andBlock:^(NSDictionary *collection, NSError *error) {
        self.dataList = [collection objectForKey:@"result"];
        [self.dataSource addDataList:self.dataList];
         [self.tableView reloadData];
    }];

}

-(void)buildTableView{
    self.dataSource = [[LightDataSource alloc] initWithCellIdentifier:@"SaleCell" cellNibName:@"SaleCell" configureCellBlock:^(SaleCell *cell, id item) {
        [cell configureCellData:item];
         [cell.editButton addActionHandler:^(NSInteger tag) {
             SaleEditViewController *edit = [[SaleEditViewController alloc]init];
             [self presentController:edit];
             [edit didDoneActionBlock:^{
                 
             }];
             [edit didCancleActionBlock:^{
                
             }];
             
             
         }];
    }];
    
    self.delegate = [[LightDelegate alloc]init];
    [self.delegate didSelectRowAtIndexPath:^(id cell, NSIndexPath *indexPath) {
        NSLog(@"%@", [NSString stringWithFormat:@"didSelectRowAtIndexPath %zd",indexPath.row]);
        SaleDetailViewController *detail = [[SaleDetailViewController alloc]init];
        detail.sale  = [Sale objectFromDictionary:self.dataSource.items[indexPath.row]];
        self.detailViewController.detailItem  = detail;
        
    }];
    [self.delegate didDeselectRowAtIndexPath:^(id cell, NSIndexPath *indexPath) {
        NSLog(@"%@", [NSString stringWithFormat:@"didDeselectRowAtIndexPath %zd",indexPath.row]);
    }];
    [self.delegate willDisplayCell:^(id cell, NSIndexPath *indexPath) {
        //NSLog(@"%@", [NSString stringWithFormat:@"willDisplayCell %zd",indexPath.row]);
    }];
    [self.delegate heightForRowAtIndexPath:^CGFloat(NSIndexPath *indexPath) {
        return 60;
    }];
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.delegate;
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
