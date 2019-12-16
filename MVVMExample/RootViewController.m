//
//  RootViewController.m
//  MVVMExample
//
//  Created by Bryant on 2019/12/15.
//  Copyright © 2019 Futurice. All rights reserved.
//

#import "RootViewController.h"
#import "RootTableProtocol.h"
#import "DataBaseManager.h"

@interface RootViewController ()<TSLManagerDelegate,RootTableProtocolDelegate>
{
    NSMutableArray<DBRecordStruc *> *displayList;
//    NSMutableArray<DataStruc *> *displayList;
    
    int total;
    
    int now;
    
    BOOL refresh;
}

@property (weak, nonatomic) IBOutlet BaseNavigationBar *titleBar;

@property (strong, nonatomic) IBOutlet RootTableProtocol *rootTableProtocol;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupResources];
}


#pragma mark - Setup Resources

- (void)setupResources
{
    displayList = [[NSMutableArray alloc] init];
    
    [self setupTitleBar];
    
    [self registerTSLManager];
    
    [self setupTableView];
    
    refresh = NO;
}

- (void)setupTitleBar
{
    [self.titleBar naviBarSetTitle:@"Coding tset"];
    
}
- (void)setupTableView
{
    [self.tableView registerNib:[UINib nibWithNibName:@"DeviceCell" bundle:nil] forCellReuseIdentifier:@"DeviceCell"];
    
    self.rootTableProtocol.delegate = self;
}

- (void)registerTSLManager
{
    //連線至自己架設的後台 位置不方便透露
    TSLManager *manager = [TSLManager sharedInstance];
    
    manager.delegate = self;
    
    [[TSLManager sharedInstance] tslGetStart:1 Amount:10];
    
}

- (void)tslResponse:(NSDictionary *)dic{
    
    NSLog(@"tslResponse = %@",dic);
    
    NSArray *ary = dic[@"resource"];
    
    total = (int)[dic[@"total"] integerValue];
    
    for (NSDictionary *detailDic in ary)
    {
        DataStruc *dataStruc = [[DataStruc alloc] init];
        
        dataStruc.date = detailDic[@"date"];
        
        dataStruc.index = [detailDic[@"index"]intValue];
        
        dataStruc.name = detailDic[@"name"];
        
        dataStruc.url = detailDic[@"url"];
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dataStruc.url]]];
        
        dataStruc.image = image;
        
        
        [[DataBaseManager sharedInstance] addRecordWithChatStruc:dataStruc];
        
        
        
        
        
//        [[DataCenter sharedInstance].displayList addObject:dataStruc];
    }
    
    NSMutableArray *array = [[DataBaseManager sharedInstance] getRecordList];
    
    
    displayList = array;//[DataCenter sharedInstance].displayList;
    
    NSLog(@"displayList = %lu",(unsigned long)displayList.count);
    
    now = (int)displayList.count;
    
    self.rootTableProtocol.detailArray = displayList;
    
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                           {
                                [self.tableView reloadData];
                                
                                refresh = NO;
         
                                [AlertProcessView hide];
                           });

}


- (void)tableviewBottom
{
    if (refresh == NO)
    {
        refresh = YES;
        
        [AlertProcessView show];
        
        NSLog(@"tableviewBottom");
        
        if (now >= total) {
            [AlertProcessView hide];
        }
        else
        {
            [[TSLManager sharedInstance] tslGetStart:now Amount:10];
        }
    }
}
@end
