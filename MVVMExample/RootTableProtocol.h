//
//  RootTableProtocol.h
//  MVVMExample
//
//  Created by Bryant on 2019/12/15.
//  Copyright © 2019 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeviceCell.h"

@protocol RootTableProtocolDelegate;

@interface RootTableProtocol : NSObject<UITableViewDelegate, UITableViewDataSource, DeviceCellDelegate>


@property (nonatomic,strong) NSMutableArray *detailArray;

@property (weak, nonatomic) id<RootTableProtocolDelegate> delegate;

@end

@protocol RootTableProtocolDelegate <NSObject>

- (void)cellClick:(DeviceCell *)cell;

- (void)tableviewBottom;

@end
