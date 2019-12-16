//
//  DBRecordStruc+CoreDataClass.m
//  
//
//  Created by Bryant on 2019/12/16.
//
//

#import "DBRecordStruc+CoreDataClass.h"

@implementation DBRecordStruc

- (void)copyInfo:(DataStruc *)dataStruc
{
    self.date = dataStruc.date;
    
    self.index = dataStruc.index;
    
    self.url = dataStruc.url;
    
    self.image = UIImageJPEGRepresentation(dataStruc.image, 1);
    
    self.name = dataStruc.name;
}

@end
