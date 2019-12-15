//
//  BaseAlertView.m
//  12Ours
//
//  Created by Bryant on 2017/7/5.
//  Copyright © 2017年 12Ours. All rights reserved.
//

#import "BaseAlertView.h"

@implementation BaseAlertView

#pragma mark - Init

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    return self;
}

- (id)init
{
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
    
    if (self)
    {
        [self setFrame:[UIApplication sharedApplication].keyWindow.frame];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:UIDeviceOrientationDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note)
         {
             [self setFrame:[UIApplication sharedApplication].keyWindow.frame];
         }];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        
        [tapGesture setDelegate:self];
        
        [self addGestureRecognizer:tapGesture];
    }
    else
    {
        self = [super init];
        
        NSLog(@"Can't Fine Nib of %@",NSStringFromClass([self class]));
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark Animation delegate

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    if ([animationID isEqualToString:BaseAlertViewShow])
    {
        if (finished)
        {
            [UIView beginAnimations:nil context:nil];
            
            self.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
            
            [UIView commitAnimations];
        }
    }
    else if ([animationID isEqualToString:BaseAlertViewHide])
    {
        if (finished)
        {
            self.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
            
            [self removeFromSuperview];
        }
    }
}

#pragma mark - Public API

- (void)showOnView:(UIView *)view
{
    self.alpha = 0;
    
    if (view != nil)
    {
        [self setFrame:view.bounds];
        
        self.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        
        [view addSubview:self];
    }
    else
    {
        [self setFrame:[UIApplication sharedApplication].keyWindow.bounds];
        
        self.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    
    [UIView beginAnimations:BaseAlertViewShow context:nil];
    
    [UIView setAnimationDelegate:self];
    
    self.view.transform = CGAffineTransformMakeScale(1.1, 1.1);
    
    self.alpha = 1;
    
    [UIView commitAnimations];
}

- (void)show
{
    [self showOnView:nil];
}

- (void)hide
{
    [UIView beginAnimations:BaseAlertViewHide context:nil];
    
    [UIView setAnimationDelegate:self];
    
    self.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    self.alpha = 0;
    
    [UIView commitAnimations];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch view] != self)
        return NO;
    else
        return YES;
}

#pragma mark - Private API

- (void)updateFrame
{
    [self setFrame:[UIApplication sharedApplication].keyWindow.frame];
}

@end
