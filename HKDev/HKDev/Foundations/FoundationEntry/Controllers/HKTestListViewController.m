//
//  HKTestListViewController.m
//  HKDev
//
//  Created by HK on 2019/4/8.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTestListViewController.h"
#import "HKTestUIViewController.h"
#import "HKTestTransitionViewController.h"

#import "HKTestTableViewCell.h"

#import "HKTestListManager.h"
#import "HKTestListItem.h"

#import <Masonry.h>

static NSString *const kCellReuseIdentify = @"kCellReuseIdentify";

@interface HKTestListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.manager numberOfItems];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HKTestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentify forIndexPath:indexPath];
    HKTestListItem *item = [self.manager itemAtIndex:indexPath.row];
    cell.titleLabel.text = item.title;
    cell.descLabel.text = item.desc;

    return cell;
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HKTestListItem *item = [self.manager itemAtIndex:indexPath.row];
    switch (item.type) {
        case HKTestTypeUIView: {
            HKTestUIViewController *testViewVC = [[HKTestUIViewController alloc] init];
            [self.navigationController pushViewController:testViewVC animated:YES];
        } break;
        case HKTestTypeTransition: {
            HKTestTransitionViewController *testTransitionVC = [[HKTestTransitionViewController alloc] init];
            [self.navigationController pushViewController:testTransitionVC animated:YES];
            
        } break;
        default:
            break;
    }
}

#pragma mark - Private
- (void)setupTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake([self navigationBarHeight] + 5, 0, 5, 0));
    }];
    
    self.tableView.contentInset = UIEdgeInsetsMake(5.f, 0.f, 0.f, 0.f);
    self.tableView.estimatedRowHeight = 50.f;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView registerClass:[HKTestTableViewCell class] forCellReuseIdentifier:kCellReuseIdentify];
}


#pragma mark - Getter

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorColor = [UIColor whiteColor];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 16, 0, 16);
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    
    return _tableView;
}

@end
