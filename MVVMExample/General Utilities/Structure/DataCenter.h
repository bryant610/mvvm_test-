//
//  DataCenter.h
//  MVVMExample
//
//  Created by Bryant on 2019/12/15.
//  Copyright © 2019 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@class DataStruc;

@interface DataCenter : NSObject

@property (strong, nonatomic) NSMutableArray<DataStruc *> *displayList;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
