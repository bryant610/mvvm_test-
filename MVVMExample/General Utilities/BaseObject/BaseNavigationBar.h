//
//  BaseNavigationBar.h
//  12Ours
//
//  Created by Bryant on 2017/6/12.
//  Copyright © 2017年 12Ours. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationBar : UIView

- (void)naviBarSetTitle:(NSString *)string;

- (void)naviBarSetLeftImage:(UIImage *)image forState:(UIControlState)state;

- (void)naviBarSetRightImage:(UIImage *)image forState:(UIControlState)state;

- (void)naviBarSetLeftLab:(NSString *)string;

- (void)naviBarSetRightLab:(NSString *)string;

- (void)naviBarSetLeftButtonAction:(SEL)action Target:(id)target Events:(UIControlEvents)controlEvents;

- (void)naviBarSetRightButtonAction:(SEL)action Target:(id)target Events:(UIControlEvents)controlEvents;

@end
