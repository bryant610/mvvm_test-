//
//  DeviceCell.m
//  12Ours
//
//  Created by Bryant on 2017/6/20.
//  Copyright © 2017年 12Ours. All rights reserved.
//

#import "DeviceCell.h"

@implementation DeviceCell
@synthesize delegate;

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupResources];
}

#pragma mark - Button Events

- (IBAction)eventsClick:(id)sender
{
    if ([delegate respondsToSelector:@selector(cellEventsClick:)])
        [delegate cellEventsClick:self];
}

- (IBAction)settingClick:(id)sender
{
    if ([delegate respondsToSelector:@selector(cellSettingClick:)])
        [delegate cellSettingClick:self];
}

#pragma mark - Utilities

- (void)setupResources
{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    
    [self.imageViewSnapshot addGestureRecognizer:gesture];
    
    [self setupFontSize];
}

- (void)setupFontSize
{
    
}

- (void)handleTap:(UITapGestureRecognizer *)gesture
{
    if ([delegate respondsToSelector:@selector(cellLiveStreamingClick:)])
        [delegate cellLiveStreamingClick:self];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    if (highlighted)
    {
        [self.view setBackgroundColor:[UIColor colorWithRed:234/255.f green:234/255.f blue:234/255.f alpha:1]];
    }
    else
    {
        [self.view setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (selected)
    {
        [self.view setBackgroundColor:[UIColor colorWithRed:234/255.f green:234/255.f blue:234/255.f alpha:1]];
    }
    else
    {
        [self.view setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    }
}

+ (CGFloat)getCellHeightFromTableViewWidth:(CGFloat)width
{
    return ((width / 375) * 120);
}

@end
