//
//  BaseViewController.m
//  12Ours
//
//  Created by Bryant on 2017/6/7.
//  Copyright © 2017年 12Ours. All rights reserved.
//

#import "BaseViewController.h"
#import "XTBubbleTransition.h"

@interface BaseViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation BaseViewController

#pragma mark - init

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        
    }
    
    return self;
}

- (void)dealloc
{
//    NSLog(@"%s",__FUNCTION__);
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (id)addBubbleInfo:(id)sender
{
    UIViewController *vc = sender;
    
    vc.transitioningDelegate = self;
    
    vc.modalPresentationStyle = UIModalPresentationCustom;
    
    return vc;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.topLayoutHeight.constant = self.topLayoutGuide.length;
    
    self.bottomLayoutHeight.constant = self.bottomLayoutGuide.length / 3 * 2;
    
    [self.view layoutIfNeeded];
}

#pragma mark - Utilities

- (void)setupInputAccessoryView:(SEL)action
{
    inputAccessoryView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:action];
    
    inputAccessoryView.items = [NSArray arrayWithObjects:flexible,right,nil];
}

#pragma mark - rotate

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Bubble Show Information View Controller

- (XTBubbleTransition *)transition
{
    if (!_transition) 
    {
        _transition = [[XTBubbleTransition alloc] init];
    }
    
    return _transition;
}

#pragma mark

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.transition.transitionMode = XTBubbleTransitionModePresent;
    
    self.transition.startPoint = transitionPoint;
    
    self.transition.bubbleColor = [UIColor colorWithRed:41.0/255.0 green:41.0/255.0 blue:41.0/255.0 alpha:0.95];
    
    return self.transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transition.transitionMode = XTBubbleTransitionModeDismiss ;
    
    self.transition.startPoint = transitionPoint;
    
    self.transition.bubbleColor = [UIColor colorWithRed:41.0/255.0 green:41.0/255.0 blue:41.0/255.0 alpha:0.95];
    
    return self.transition;
}

@end
