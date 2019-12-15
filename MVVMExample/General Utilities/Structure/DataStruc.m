//
//  DataStruc.m
//  MVVMExample
//
//  Created by Bryant on 2019/12/15.
//  Copyright © 2019 Futurice. All rights reserved.
//

#import "DataStruc.h"
#import <objc/message.h>


@implementation DataStruc
@synthesize date;
@synthesize index;
@synthesize url;
@synthesize name;
@synthesize image;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        date = @"";
        index = 0;
        url = @"";
        name = @"";
        image = nil;
    }
    
    return self;
}

#pragma mark - NSCoder

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self)
    {
        date          = [aDecoder decodeObjectForKey:@"date"];
        name         = [aDecoder decodeObjectForKey:@"name"];
        url           = [aDecoder decodeObjectForKey:@"url"];
        index        = [[aDecoder decodeObjectForKey:@"id"] integerValue];
    }
    
    return self;
}

@end
