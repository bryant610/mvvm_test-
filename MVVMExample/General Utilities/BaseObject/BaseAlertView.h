//
//  BaseAlertView.h
//  12Ours
//
//  Created by Bryant on 2017/7/5.
//  Copyright © 2017年 12Ours. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BaseAlertViewShow @"BaseAlertViewShow"

#define BaseAlertViewHide @"BaseAlertViewHide"

@interface BaseAlertView : UIView<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *view;

- (id)init;

- (void)show;

- (void)showOnView:(UIView *)view;

- (void)hide;

@end
