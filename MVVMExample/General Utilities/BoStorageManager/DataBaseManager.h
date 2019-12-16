//
//  DataBaseManager.h
//  AO Common App
//
//  Created by Bryant on 2016/1/27.
//  Copyright © 2016年 ASIA OPTICAL CO., INC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DBRecordStruc+CoreDataClass.h"

@interface DataBaseManager : NSObject
{
    NSManagedObjectContext *managedObjectContext;
    
    NSManagedObjectModel *managedObjectModel;
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

+ (id)sharedInstance;

- (NSMutableArray<DBRecordStruc *> *)getRecordList;
- (BOOL)checkRecordExist:(DBRecordStruc *)record;
- (void)addRecordWithChatStruc:(DataStruc *)dataStruc;
- (BOOL)develeRecord:(DBRecordStruc *)dbRecord;

@end
