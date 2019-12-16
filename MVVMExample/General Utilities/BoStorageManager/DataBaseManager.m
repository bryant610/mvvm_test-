//
//  DataBaseManager.m
//  AO Common App
//
//  Created by Bryant on 2016/1/27.
//  Copyright © 2016年 ASIA OPTICAL CO., INC. All rights reserved.
//

#import "DataBaseManager.h"


@implementation DataBaseManager

+ (id)sharedInstance
{
    static DataBaseManager *pSelf;
    
    static dispatch_once_t singletonToken;
    
    dispatch_once(&singletonToken,^
                  {
                      pSelf = [[self alloc] init];
                  });
    
    return pSelf;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        
    }
    
    return self;
}

#pragma mark - Public Methods

- (NSMutableArray<DBRecordStruc *> *)getRecordList//:(NSInteger)index
{
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"index == %ld",index];

    NSError *error;

    NSFetchRequest *request = [[NSFetchRequest alloc]init];

    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DBRecordStruc" inManagedObjectContext:[self managedObjectContext]];

//    [request setPredicate:predicate];

    [request setEntity:entity];

    NSSortDescriptor *sort = [[NSSortDescriptor alloc]initWithKey:@"date" ascending:YES];

    NSArray *sortDescriptors = [NSArray arrayWithObject:sort];

    [request setSortDescriptors: sortDescriptors];

    NSMutableArray *mu = [[[self managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];

    return mu;
}

- (BOOL)checkRecordExist:(DBRecordStruc *)record
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"index == %d AND date == %@",record.index, record.date];

    NSError *error;

    NSFetchRequest *request = [[NSFetchRequest alloc]init];

    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DBRecordStruc" inManagedObjectContext:[self managedObjectContext]];

    [request setPredicate:predicate];

    [request setEntity:entity];

    NSSortDescriptor *sort = [[NSSortDescriptor alloc]initWithKey:@"date" ascending:YES];

    NSArray *sortDescriptors = [NSArray arrayWithObject:sort];

    [request setSortDescriptors: sortDescriptors];

    NSUInteger count = [[self managedObjectContext] countForFetchRequest:request error:&error];

    if (count > 0)
        return YES;
    else
        return NO;
}

- (void)addRecordWithChatStruc:(DataStruc *)dataStruc
{
    if (1)//![self checkChatRecordExist:chatStruc])
    {
        DBRecordStruc *dbRecord = (DBRecordStruc *) [NSEntityDescription insertNewObjectForEntityForName:@"DBRecordStruc" inManagedObjectContext:[self managedObjectContext]];

        [dbRecord copyInfo:dataStruc];

        [self saveDBFile];
    }
}

- (BOOL)develeRecord:(DBRecordStruc *)dbRecord
{
    NSError *error;

    BOOL success;

    [[self managedObjectContext] deleteObject:dbRecord];

    if (![[self managedObjectContext] save:&error])
    {
        success = NO;
    }
    else
    {
        success = YES;
    }

    return success;
}

#pragma mark - Private Methods

- (BOOL)saveDBFile
{
    NSError *error;
    
    BOOL success;
    
    if ([[self managedObjectContext] hasChanges] && ![[self managedObjectContext] save:&error])
    {
        NSLog(@"Problem Saving:%@",[error localizedDescription]);
        
        success = NO;
    }
    else
    {
        NSLog(@"Save News is OK");
        
        success = YES;
    }
    
    return success;
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (managedObjectContext != nil)
    {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (coordinator != nil)
    {
        managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (managedObjectModel != nil)
    {
        return managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DataBaseManager" withExtension:@"momd"];
    
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (persistentStoreCoordinator != nil)
    {
        return persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"DataBaseManager.sqlite"];
    
    NSError *error = nil;
    
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    NSDictionary *options = @{ /*NSSQLitePragmasOption : @{@"journal_mode" : @"DELETE"} ,*/
                              NSMigratePersistentStoresAutomaticallyOption : [NSNumber numberWithBool:YES] ,
                              NSInferMappingModelAutomaticallyOption : [NSNumber numberWithBool:YES] };
    // Default journal mode is WAL (WAL is fast)
    
    //Core Data Migration
    
    // if the entities or attribute change on DataModel , need to add the two key for Core Data Migration
    //NSMigratePersistentStoresAutomaticallyOption
    //NSInferMappingModelAutomaticallyOption
    
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        
        abort();
    }
    
    return persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
