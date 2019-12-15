//
//  AlertProcessView.m
//  12Ours
//
//  Created by Bryant on 2017/7/5.
//  Copyright © 2017年 12Ours. All rights reserved.
//

#import "AlertProcessView.h"

@implementation AlertProcessView

#pragma mark - Init

+ (id)sharedInstance
{
    static AlertProcessView *processView;
    
    static dispatch_once_t singletonToken;
    
    dispatch_once(&singletonToken,^
    {
        processView = [[self alloc] init];
    });
    
    return processView;
}

- (id)init
{
    self = [super init];
    
    pi = 90;
    
    [self removeGestureRecognizer:self.gestureRecognizers[0]];
    
    self.isShow = NO;
    
    return self;
}

- (void)show
{
    [self showOnView:nil];
}

- (void)showOnView:(UIView *)view
{
    if (self.active.hidden)
    {
        self.active.hidden = NO;
        
        pi = 90;
        
        self.active.transform = CGAffineTransformMakeRotation(0 * (M_PI / 180.0f));;
        
        [self startRotate];
        
        if (view != nil)
            [self.view setBackgroundColor:[UIColor clearColor]];
        
        self.isShow = YES;
        
        [super showOnView:view];
    }
}

- (void)hide
{
    self.active.hidden = YES;
    
    self.isShow = NO;
    
    [super hide];
}

- (void)startRotate
{
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(pi * (M_PI / 180.0f));
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^
    {
        self.active.transform = endAngle;
        
    }
                     completion:^(BOOL finished)
    {
        
        self->pi += 90;
        
        if (!self.active.hidden)
        {
            [self startRotate];
        }
    }];
}

+ (void)show
{
    [[AlertProcessView sharedInstance] show];
}

+ (void)showOnView:(UIView *)view
{
    [[AlertProcessView sharedInstance] showOnView:view];
}

+ (void)hide
{
    [[AlertProcessView sharedInstance] hide];
}

+ (BOOL)isShowOnView
{
    AlertProcessView *processView = [AlertProcessView sharedInstance];
    
    return processView.isShow;
}

@end
