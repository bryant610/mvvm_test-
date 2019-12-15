//
//  ThumbnailTempCache.m
//  GalaxyView
//
//  Created by  Bryant on 2018/10/23.
//  Copyright © 2018  Bryant. All rights reserved.
//

#import "ThumbnailTempCache.h"

@implementation ThumbnailTempCache

+ (void)createThmCache:(NSData *)data FileName:(NSString *)fileName
{
    NSString *tempPath = NSTemporaryDirectory();
    
    NSString *fullPath = [tempPath stringByAppendingString:fileName];
    
//    NSArray *documentsAry = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:tempPath error:nil];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:fullPath])
    {
        NSLog(@"Has Cache");
        
        NSData *rowData = [NSData dataWithContentsOfFile:fullPath];
        
        NSLog(@"rowData = %ld",rowData.length);
        
//        [[NSFileManager defaultManager] removeItemAtPath:[fileURL absoluteString] error:nil];
    }
    else
    {
        NSURL *fileURL = [NSURL fileURLWithPath:fullPath];
        
        [data writeToURL:fileURL atomically:YES];
        
        NSLog(@"Write Cache");
    }
}

+ (UIImage *)getThmCache:(NSString *)fileName
{
    UIImage *thmImage = nil;
    
    NSString *tempPath = NSTemporaryDirectory();
    
    NSString *fullPath = [tempPath stringByAppendingString:fileName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:fullPath])
    {
        NSData *rowData = [NSData dataWithContentsOfFile:fullPath];
        
        thmImage = [UIImage imageWithData:rowData];
    }
    
    return thmImage;
}


@end
