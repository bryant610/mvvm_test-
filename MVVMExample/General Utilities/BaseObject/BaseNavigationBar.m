//
//  BaseNavigationBar.m
//  12Ours
//
//  Created by Bryant on 2017/6/12.
//  Copyright © 2017年 12Ours. All rights reserved.
//

#import "BaseNavigationBar.h"

@interface BaseNavigationBar()

@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UIButton *leftButton;

@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@property (weak, nonatomic) IBOutlet UILabel *leftLab;

@property (weak, nonatomic) IBOutlet UILabel *rightLab;

@end


@implementation BaseNavigationBar

- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self loadXIB];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self loadXIB];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self loadXIB];
    }
    
    return self;
}

- (void)loadXIB
{
    if ([self.view isDescendantOfView:self])
        return;
    
    self.view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
    
    self.clipsToBounds = YES;
    
    [self addSubview:self.view];
}

- (void)drawRect:(CGRect)rect
{
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraints:@[
                           [NSLayoutConstraint constraintWithItem:self.view
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0
                                                         constant:0.0] ,
                           [NSLayoutConstraint constraintWithItem:self.view
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeading
                                                       multiplier:1
                                                         constant:0.0],
                           [NSLayoutConstraint constraintWithItem:self
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.view
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1
                                                         constant:0.0],
                           [NSLayoutConstraint constraintWithItem:self
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.view
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0
                                                         constant:0.0]
                           ]];
    
    [self layoutIfNeeded];
    
    [self setupFontSize];
}

#pragma mark - Utilities

- (void)setupFontSize
{
//    [self.title setFont:[UIFont fontWithName:FONT_HELVETICA_NEUE size:[Utilities getFontSize] + 3]];
//
//    [self.leftLab setFont:[UIFont fontWithName:FONT_HELVETICA_NEUE size:[Utilities getFontSize] + 2]];
//
//    [self.rightLab setFont:[UIFont fontWithName:FONT_HELVETICA_NEUE size:[Utilities getFontSize] + 2]];
}

- (void)naviBarSetTitle:(NSString *)string
{
    self.titleLab.text = string;
}

- (void)naviBarSetLeftImage:(UIImage *)image forState:(UIControlState)state
{
    [self.leftButton setImage:image forState:state];
}

- (void)naviBarSetRightImage:(UIImage *)image forState:(UIControlState)state
{
    [self.rightButton setImage:image forState:state];
}

- (void)naviBarSetLeftLab:(NSString *)string
{
    [self.leftLab setHidden:NO];
    
    self.leftLab.text = string;
}

- (void)naviBarSetRightLab:(NSString *)string
{
    [self.rightLab setHidden:NO];
    
    self.rightLab.text = string;
}

- (void)naviBarSetLeftButtonAction:(SEL)action Target:(id)target Events:(UIControlEvents)controlEvents
{
    [self.leftButton removeTarget:target action:action forControlEvents:controlEvents];
    
    [self.leftButton addTarget:target action:action forControlEvents:controlEvents];
}

- (void)naviBarSetRightButtonAction:(SEL)action Target:(id)target Events:(UIControlEvents)controlEvents
{
    [self.rightButton removeTarget:target action:action forControlEvents:controlEvents];
    
    [self.rightButton addTarget:target action:action forControlEvents:controlEvents];
}

@end
