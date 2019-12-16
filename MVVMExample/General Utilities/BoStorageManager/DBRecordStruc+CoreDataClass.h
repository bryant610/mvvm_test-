//
//  DBRecordStruc+CoreDataClass.h
//  
//
//  Created by Bryant on 2019/12/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBRecordStruc : NSManagedObject

- (void)copyInfo:(DataStruc *)dataStruc;

@end

NS_ASSUME_NONNULL_END

#import "DBRecordStruc+CoreDataProperties.h"
