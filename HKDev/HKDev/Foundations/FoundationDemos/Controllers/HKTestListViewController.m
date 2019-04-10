//
//  HKTestListViewController.m
//  HKDev
//
//  Created by HK on 2019/4/8.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTestListViewController.h"

#import "HKTestTableViewCell.h"

#import "HKTestListManager.h"
#import "HKTestListItem.h"


static NSString *const kCellReuseIdentify = @"kCellReuseIdentify";

@interface HKTestListViewController ()

@property (strong, nonatomic) HKTestListManager *manager;

@end

@implementation HKTestListViewController

- (instancetype)initWithManager:(HKTestListManager *)manager
{
    if (!manager) {
        return nil;
    }
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.manager numberOfItems];;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HKTestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentify forIndexPath:indexPath];
    HKTestListItem *item = [self.manager itemAtIndex:indexPath.section];
    cell.titleLabel.text = item.title;
    cell.descLabel.text = item.desc;

    return cell;
}

#pragma mark - Private
- (void)setupTableView
{
    self.tableView.contentInset = UIEdgeInsetsMake(5.f, 0.f, 0.f, 0.f);
    self.tableView.estimatedRowHeight = 50.f;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView registerClass:[HKTestTableViewCell class] forCellReuseIdentifier:kCellReuseIdentify];
}

@end
