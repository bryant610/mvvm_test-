//
//  TSLManager.h
//  TSLManager
//
//  Created by Bryant on 2017/7/24.
//  Copyright © 2017年 TSLManager. All rights reserved.
//
//  Use TSLib
//  version 1.0.0
//  build 20191213


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum
{
    TSL_DEBUG_LEVEL_NONE                = 0,
    TSL_DEBUG_LEVEL_ALL                 = 1,
    
} TSL_DEBUG_LEVEL;

typedef enum
{
    TSL_REPONSE_ERR_SUCCESS             = 0,
    TSL_REPONSE_ERR_INVALIDE_JOB        = -1,


} TSL_RSPONSE_CODE;




@protocol TSLManagerDelegate <NSObject>

@optional
- (void)tslResponse:(NSDictionary *)dic;


@end

@interface TSLManager : NSObject
{
    
}

@property (nonatomic, assign) NSInteger cmdTimeout;

@property (nonatomic, strong) id<TSLManagerDelegate> delegate;

- (id)init;

+ (id)sharedInstance;

#pragma mark - Public API

- (void)tslInitWithDebugLevel:(TSL_DEBUG_LEVEL)level;
- (void)tslGetAllList;
- (void)tslGetStart:(int)index Amount:(int)amount;

@end
