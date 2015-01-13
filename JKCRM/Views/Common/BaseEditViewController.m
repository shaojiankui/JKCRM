//
//  BaseEditViewController.m
//  JKCRM
//
//  Created by Jakey on 15/1/7.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "BaseEditViewController.h"

@interface BaseEditViewController ()

@end

@implementation BaseEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.root = [[QRootElement alloc] initWithJSONFile:NSStringFromClass([self class]) andData:nil];
    self.resizeWhenKeyboardPresented = YES;
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)didDoneActionBlock:(void (^)())didDoneActionBlock{
    if (didDoneActionBlock) {
        _didDoneActionBlock = didDoneActionBlock;
    }
}
- (void)didCancleActionBlock:(void (^)())didCancleActionBlock{
    if (didCancleActionBlock) {
        _didCancleActionBlock = didCancleActionBlock;
    }
}


- (IBAction)doneTouched:(id)sender {
    NSLog(@"done button Touched");
    [self dismissViewControllerAnimated:YES completion:^{
        if (_didDoneActionBlock) {
            _didDoneActionBlock();
        }
    }];
}
- (IBAction)cancleTouched:(id)sender {
    NSLog(@"cancle button Touched");
    [self dismissViewControllerAnimated:YES completion:^{
        if (_didCancleActionBlock) {
            _didCancleActionBlock();
        }
    }];
    
}
@end
