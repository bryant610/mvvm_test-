//
//  DeviceCell.h
//  12Ours
//
//  Created by Bryant on 2017/6/20.
//  Copyright © 2017年 12Ours. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DeviceCellDelegate;

@interface DeviceCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewSnapshot;
@property (weak, nonatomic) IBOutlet UILabel *labPrivacy;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *active;

@property (weak, nonatomic) IBOutlet UILabel *labName;
@property (weak, nonatomic) IBOutlet UILabel *labEventDate;


@property (weak, nonatomic) IBOutlet UIButton *buttonEvent;

@property (weak, nonatomic) id<DeviceCellDelegate> delegate;

+ (CGFloat)getCellHeightFromTableViewWidth:(CGFloat)width;

@end

@protocol DeviceCellDelegate <NSObject>

- (void)cellEventsClick:(DeviceCell *)cell;

- (void)cellLiveStreamingClick:(DeviceCell *)cell;

@end
