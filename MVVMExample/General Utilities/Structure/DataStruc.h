//
//  DataStruc.h
//  MVVMExample
//
//  Created by Bryant on 2019/12/15.
//  Copyright © 2019 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AutoBindObject.h"

NS_ASSUME_NONNULL_BEGIN




@interface DataStruc : AutoBindObject<NSCoding>

@property (nonatomic, strong) NSString *date;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) UIImage *image;


- (id)init;

@end

NS_ASSUME_NONNULL_END
