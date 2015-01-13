//
//  BaseEditViewController.h
//  JKCRM
//
//  Created by Jakey on 15/1/7.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^DidActionBlock)();
@interface BaseEditViewController : QuickDialogController
{
    DidActionBlock _didDoneActionBlock;
    DidActionBlock _didCancleActionBlock;

}
- (IBAction)doneTouched:(id)sender;
- (IBAction)cancleTouched:(id)sender;

- (void)didDoneActionBlock:(void (^)())didDoneActionBlock;
- (void)didCancleActionBlock:(void (^)())didCancleActionBlock;

@end
