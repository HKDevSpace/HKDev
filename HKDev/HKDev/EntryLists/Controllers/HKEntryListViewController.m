//
//  HKEntryListViewController.m
//  HKDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKEntryListViewController.h"
#import "LSEntryViewController.h"
#import "HKTestListViewController.h"
#import "HKEntryTableViewCell.h"
#import "HKTestListManager.h"


static NSString *const kCellReuseIdentifier = @"kCellReuseIdentifier";


@interface HKEntryListViewController ()

@property (strong, nonatomic) HKEntryListManager *manager;

@end

@implementation HKEntryListViewController

- (instancetype)initWithManager:(HKEntryListManager *)manager
{
    self = [super init];
    if (self) {
        _manager = manager;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.manager.title;
    [self setupTableView];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.manager numberOfItems];
}
    

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HKEntryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    
    HKEntryListItem *item = [self.manager itemAtIndex:indexPath.row];
    cell.titleLabel.text = item.title;
    cell.descLabel.text = item.desc;

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *targetViewController;
    
    HKEntryListItem *item = [self.manager itemAtIndex:indexPath.row];
    //TODO: Detail
    switch (item.type) {
        case HKEntryTypeLiveShow: {
            LSEntryViewController *liveShowEntryVC = [[LSEntryViewController alloc] init];
            targetViewController = liveShowEntryVC;
        } break;
            
        case HKEntryTypeNSFoundation:    // <Foundation> 框架
        case HKEntryTypeUIKit:           // <UIKit> 框架
        case HKEntryTypeAVFoundation:    // <AVFoundation> 框架
        case HKEntryTypeThirdLibrary: {  // 第三方库
            HKTestListManager *testManager = [[HKTestListManager alloc] initWithType:item.type];
            targetViewController = [[HKTestListViewController alloc] initWithManager:testManager];
            
        } break;
            
        default:
            break;
    }
    
    if (targetViewController) {
        [self.navigationController pushViewController:targetViewController animated:YES];
    }
}



#pragma mark - Private
- (void)setupTableView
{
    self.tableView.contentInset = UIEdgeInsetsMake(5.f, 0.f, 0.f, 0.f);
    self.tableView.estimatedRowHeight = 50.f;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView registerClass:[HKEntryTableViewCell class] forCellReuseIdentifier:kCellReuseIdentifier];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
