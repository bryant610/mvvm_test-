//
//  RootTableProtocol.m
//  MVVMExample
//
//  Created by Bryant on 2019/12/15.
//  Copyright © 2019 Futurice. All rights reserved.
//

#import "RootTableProtocol.h"

@implementation RootTableProtocol
@synthesize detailArray;
@synthesize delegate;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return detailArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = [DeviceCell getCellHeightFromTableViewWidth:tableView.frame.size.width];
    
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DeviceCell *cell = (DeviceCell *)[tableView dequeueReusableCellWithIdentifier:@"DeviceCell"];
    
    DataStruc *dataStruc = detailArray[indexPath.row];
    
    cell.delegate = self;
    
    [self Cell:cell MappingStruc:dataStruc];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
    {
        if ([delegate respondsToSelector:@selector(tableviewBottom)])
        [delegate tableviewBottom];
    }
}
- (void)Cell:(DeviceCell *)cell MappingStruc:(DataStruc *)dataStruc
{
    cell.labName.text = dataStruc.name;
    
    [cell.imageViewSnapshot setImage:dataStruc.image];
    
}
- (void)cellEventsClick:(DeviceCell *)cell {
    NSLog(@"cellEventsClick");
}

- (void)cellLiveStreamingClick:(DeviceCell *)cell {
    NSLog(@"cellLiveStreamingClick");
}

- (void)cellSettingClick:(DeviceCell *)cell {
    NSLog(@"cellSettingClick");
}

@end
