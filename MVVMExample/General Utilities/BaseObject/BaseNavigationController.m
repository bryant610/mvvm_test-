//
//  BaseNavigationController.m
//  12Ours
//
//  Created by Bryant on 2017/6/7.
//  Copyright © 2017年 12Ours. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

#pragma mark - init

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self setNavigationBarHidden:YES];
    }
    
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    
    if (self)
    {
        [self setNavigationBarHidden:YES];
    }
    
    return self;
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}

- (UIViewController *)childViewControllerForStatusBarHidden
{
    return self.topViewController;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.topViewController.preferredStatusBarStyle;
}

#pragma mark - rotate

- (BOOL)shouldAutorotate
{
    return [[self topViewController] shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [[self topViewController] supportedInterfaceOrientations];
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
    return [[self topViewController] prefersHomeIndicatorAutoHidden];
}

- (UIViewController *)childViewControllerForHomeIndicatorAutoHidden
{
    return [self topViewController];
}

@end
