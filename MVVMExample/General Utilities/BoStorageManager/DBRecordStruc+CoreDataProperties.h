//
//  DBRecordStruc+CoreDataProperties.h
//  
//
//  Created by Bryant on 2019/12/16.
//
//

#import "DBRecordStruc+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DBRecordStruc (CoreDataProperties)

+ (NSFetchRequest<DBRecordStruc *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *date;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, copy) NSString *url;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t index;

@end

NS_ASSUME_NONNULL_END
