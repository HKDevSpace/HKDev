//
//  LSEntryViewController.m
//  HKDev
//
//  Created by HK on 2019/3/28.
//  Copyright © 2019 HK. All rights reserved.
//

#import "LSEntryViewController.h"
#import "LSPrepareRecordViewController.h"

#import <Masonry.h>

@interface LSEntryViewController ()

@property (strong, nonatomic) UIButton *recordButton;


@end

@implementation LSEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}


#pragma mark - Action
- (void)recordAction
{
    LSPrepareRecordViewController *prepareRecordVC = [[LSPrepareRecordViewController alloc] init];
    [self.navigationController pushViewController:prepareRecordVC animated:YES];
}

#pragma mark - Private
- (void)setupViews
{
    self.title = @"Live Show";
    
    [self.view addSubview:self.recordButton];
    [self.recordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(20.f);
        make.left.equalTo(self.view).with.offset(20.f);
        make.right.equalTo(self.view.mas_centerX).with.offset(-10.f);
    }];
}

#pragma mark - Getter

- (UIButton *)recordButton
{
    if (!_recordButton) {
        _recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _recordButton.backgroundColor = [UIColor yellowColor];
        [_recordButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [_recordButton setTitle:@"Record" forState:UIControlStateNormal];
        [_recordButton addTarget:self action:@selector(recordAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _recordButton;
}

@end
