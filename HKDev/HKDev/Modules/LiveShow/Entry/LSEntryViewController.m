//
//  LSEntryViewController.m
//  HKDev
//
//  Created by HK on 2019/3/28.
//  Copyright © 2019 HK. All rights reserved.
//

#import "LSEntryViewController.h"
#import "LSPrepareRecordViewController.h"

#import "UIDevice+HKExtension.h"
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
        make.top.equalTo(self.view).with.offset(64.f + 20.f + ([UIDevice isNotchScreen] ? 24.f : 0.f));
        make.left.equalTo(self.view).with.offset(20.f);
        make.right.equalTo(self.view.mas_centerX).with.offset(-10.f);
    }];
}

#pragma mark - Getter

- (UIButton *)recordButton
{
    if (!_recordButton) {
        _recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_recordButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [_recordButton setTitle:@"Record" forState:UIControlStateNormal];
        [_recordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _recordButton.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.7].CGColor;
        _recordButton.layer.borderWidth = 0.5;
        _recordButton.layer.cornerRadius = 3.f;
        [_recordButton addTarget:self action:@selector(recordAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _recordButton;
}

@end
