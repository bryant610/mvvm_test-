//
//  ThumbnailTempCache.h
//  GalaxyView
//
//  Created by  Bryant on 2018/10/23.
//  Copyright © 2018  Bryant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThumbnailTempCache : NSObject

+ (void)createThmCache:(NSData *)data FileName:(NSString *)fileName;

+ (UIImage *)getThmCache:(NSString *)fileName;

@end
