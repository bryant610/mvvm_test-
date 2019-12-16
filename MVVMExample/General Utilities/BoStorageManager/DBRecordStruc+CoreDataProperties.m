//
//  DBRecordStruc+CoreDataProperties.m
//  
//
//  Created by Bryant on 2019/12/16.
//
//

#import "DBRecordStruc+CoreDataProperties.h"

@implementation DBRecordStruc (CoreDataProperties)

+ (NSFetchRequest<DBRecordStruc *> *)fetchRequest
{
	return [NSFetchRequest fetchRequestWithEntityName:@"DBRecordStruc"];
}

@dynamic date;
@dynamic image;
@dynamic url;
@dynamic name;
@dynamic index;

@end
