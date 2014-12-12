//
//  SaleDetailViewController.m
//  JKCRM
//
//  Created by Jakey on 14/11/27.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "SaleDetailViewController.h"

@interface SaleDetailViewController ()

@end

@implementation SaleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titleLable.text = self.sale.saleName;
    self.root = [[QRootElement alloc] initWithJSONFile:@"SaleDetailViewController" andData:[self.sale toDictionary]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)test:(QElement *)button{


}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
