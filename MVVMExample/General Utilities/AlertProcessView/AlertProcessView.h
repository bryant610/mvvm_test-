//
//  AlertProcessView.h
//  12Ours
//
//  Created by Bryant on 2017/7/5.
//  Copyright © 2017年 12Ours. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseAlertView.h"

@interface AlertProcessView : BaseAlertView
{
    BOOL isRotate;
    
    float pi;
}

@property (nonatomic) BOOL isShow;

@property (weak, nonatomic) IBOutlet UIImageView *active;

+ (id)sharedInstance;

+ (void)show;

+ (void)showOnView:(UIView *)view;

+ (void)hide;

+ (BOOL)isShowOnView;

@end
