//
//  DataCenter.m
//  MVVMExample
//
//  Created by Bryant on 2019/12/15.
//  Copyright © 2019 Futurice. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (instancetype)sharedInstance
{
    static DataCenter *dataCenter;
    
    static dispatch_once_t singletonToken;
    
    dispatch_once(&singletonToken,^
                  {
                      dataCenter = [[self alloc] init];
                  });
    
    return dataCenter;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.displayList = [[NSMutableArray alloc] init];
        
        
    }
    
    return self;
}


@end
