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
#import "HKBannerViewController.h"
#import "HKVideoListViewController.h"

#import "HKEntryTableViewCell.h"
#import "HKTestListManager.h"

#import <Masonry.h>


static NSString *const kCellReuseIdentifier = @"kCellReuseIdentifier";


@interface HKEntryListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
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

- (void)volumeChanged:(id)no
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(volumeChanged:)
                                                 name:@"AVSystemController_SystemVolumeDidChangeNotification"
                                               object:nil];
    
    self.title = self.manager.title;
    [self setupTableView];
    
    [self.tableView reloadData];
    
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
        case HKEntryTypeVOD: {
            HKVideoListViewController *videoListVC = [[HKVideoListViewController alloc] init];
            targetViewController = videoListVC;
        } break;
        case HKEntryTypeBanner: {         // 轮播
            HKBannerViewController *bannerVC = [[HKBannerViewController alloc] init];
            targetViewController = bannerVC;
        } break;
        case HKEntryTypePhotoPicker: {    // 相册选择器
        } break;
        case HKEntryTypeInputTextView: {  // 输入框
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
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake([self navigationBarHeight] + 5.f, 0, 0, 0));
    }];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f);
    self.tableView.estimatedRowHeight = 50.f;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView registerClass:[HKEntryTableViewCell class] forCellReuseIdentifier:kCellReuseIdentifier];
}

#pragma mark - Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}


@end
