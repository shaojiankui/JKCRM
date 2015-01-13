//
//  BaseMasterViewController.m
//  JKCRM
//
//  Created by Jakey on 14/11/26.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "BaseMasterViewController.h"
#import "BaseEditViewController.h"
@interface BaseMasterViewController ()

@end

@implementation BaseMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.detailViewController = (DetailViewController*)[Util SplitViewController].detailViewController;
    self.addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.addButton.frame = CGRectMake(self.view.right-40, 0, 40, 40);
    [self.view addSubview:self.addButton];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)presentController:(UIViewController*)controller{
    
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:controller];

    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    cancleButton.frame = CGRectMake(0, 0, 60, 40);
    [cancleButton setTitle:@"Cancle" forState:UIControlStateNormal];
    [cancleButton addTarget:controller action:@selector(cancleTouched:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *cancleBarButton = [[UIBarButtonItem alloc] initWithCustomView:cancleButton];
    
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    doneButton.frame = CGRectMake(0, 0, 60, 40);
    [doneButton addTarget:controller action:@selector(doneTouched:) forControlEvents:UIControlEventTouchUpInside];
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithCustomView:doneButton];
    
    controller.navigationItem.leftBarButtonItem = cancleBarButton;
    controller.navigationItem.rightBarButtonItem = doneBarButton;
    navigation.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self.RootViewControler presentViewController:navigation animated:YES completion:nil];
}

-(void)loadData{

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
