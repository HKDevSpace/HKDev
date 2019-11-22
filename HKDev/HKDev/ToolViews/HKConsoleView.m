//
//  HKConsoleView.m
//  HKDev
//
//  Created by HK on 2019/4/12.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKConsoleView.h"
#import "HKConsoleConfigure.h"
#import "HKConsoleManager.h"
#import "HKConsoleLogTVCell.h"

#import <ReactiveObjC.h>
#import <Masonry.h>

static NSString *const kLogCellReuseIdentifier = @"kLogCellReuseIdentifier";

@interface HKConsoleView () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) HKConsoleConfigure *configure;
@property (strong, nonatomic) HKConsoleManager *manager;

@property (nonatomic) BOOL autoScrollToBottom;

@end

@implementation HKConsoleView

#pragma mark - Initailization
+ (HKConsoleView *)consoleView
{
    return [[self alloc] init];
}


+ (HKConsoleView *)consoleViewWithConfigure:(HKConsoleConfigure *)configure
{
    HKConsoleView *view = [[self alloc] init];
    view.configure = configure;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        
        _configure = [HKConsoleConfigure defaultConfig];
        _autoScrollToBottom = YES;
        [self setupViews];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateDataSource) name:HKConsoleLogUpdateNotification object:nil];
        
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Logs
- (void)info:(NSString *)log
{
    [self.manager info:[self.configure attributedInfoLog:log]];
}

- (void)debug:(NSString *)log
{
    [self.manager debug:[self.configure attributedDebugLog:log]];
}

- (void)error:(NSString *)log
{
    [self.manager error:[self.configure attributedErrorLog:log]];
}

- (void)warn:(NSString *)log
{
    [self.manager warn:[self.configure attributedWarnLog:log]];
}


#pragma mark - <UITableViewDataSource>
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
    HKConsoleLogTVCell *cell = [tableView dequeueReusableCellWithIdentifier:kLogCellReuseIdentifier forIndexPath:indexPath];
    NSAttributedString *attrStr = [self.manager itemAtIndex:indexPath.row];
    cell.logLabel.attributedText = attrStr;
    

    return cell;
}


#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.bounds.size.height + scrollView.contentOffset.y > scrollView.contentSize.height - 5) {
        self.autoScrollToBottom = YES;
        [self updateDataSource];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.autoScrollToBottom = NO;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        if (scrollView.bounds.size.height + scrollView.contentOffset.y > scrollView.contentSize.height - 5) {
            self.autoScrollToBottom = YES;
            [self updateDataSource];
        }
    }
}
    


#pragma mark - Private
- (void)setupViews
{
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

- (void)updateDataSource
{
    if (self.autoScrollToBottom) {
        
        [self.tableView reloadData];
        if (self.autoScrollToBottom && self.tableView.contentSize.height > self.tableView.bounds.size.height && self.tableView.bounds.size.height > 0.f) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.manager numberOfItems] -1) inSection:0];
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        }
    }
}

#pragma mark - Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 50.f;

        [_tableView registerClass:[HKConsoleLogTVCell class] forCellReuseIdentifier:kLogCellReuseIdentifier];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (HKConsoleManager *)manager
{
    if (!_manager) {
        _manager = [[HKConsoleManager alloc] init];
    }
    return _manager;
}


@end
