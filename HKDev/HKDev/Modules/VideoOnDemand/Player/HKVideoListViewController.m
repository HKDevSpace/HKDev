//
//  HKVideoListViewController.m
//  HKScreenRotateDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKVideoListViewController.h"
#import "HKPlayerViewController.h"

#import <Masonry/Masonry.h>

@interface HKVideoListViewController ()


@property (strong, nonatomic) UISegmentedControl *jumpModeControl;
@property (strong, nonatomic) UISegmentedControl *orientationControl;
@property (strong, nonatomic) UIButton *actionButton;

@end

@implementation HKVideoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    
}


#pragma mark - Action
- (void)jumpAction
{
    HKPlayerViewController *playerVC = [[HKPlayerViewController alloc] init];
    
    if (self.jumpModeControl.selectedSegmentIndex == 0) { // push
        [self.navigationController pushViewController:playerVC animated:YES];
    } else { // Present
        [self presentViewController:playerVC animated:YES completion:^{ }];
    }
}

#pragma mark - Private
- (void)setupViews
{
    [self.view addSubview:self.jumpModeControl];
    [self.view addSubview:self.orientationControl];
    [self.view addSubview:self.actionButton];
    
    [self.jumpModeControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10.f);
        make.right.equalTo(self.view).with.offset(-10.f);
        make.top.equalTo(self.view).with.offset(150);
    }];
    
    [self.orientationControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10.f);
        make.right.equalTo(self.view).with.offset(-10.f);
        make.top.equalTo(self.jumpModeControl.mas_bottom).with.offset(20);
    }];
    
    [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10.f);
        make.right.equalTo(self.view).with.offset(-10.f);
        make.top.equalTo(self.orientationControl.mas_bottom).with.offset(20);
    }];
}


#pragma mark - Getter
- (UISegmentedControl *)jumpModeControl
{
    if (!_jumpModeControl) {
        _jumpModeControl = [[UISegmentedControl alloc] initWithItems:@[@"Push", @"Present"]];
        _jumpModeControl.selectedSegmentIndex = 0;
    }
    return _jumpModeControl;
}

- (UISegmentedControl *)orientationControl
{
    if (!_orientationControl) {
        _orientationControl = [[UISegmentedControl alloc] initWithItems:@[@"Portrait", @"Left", @"Right"]];
        _orientationControl.selectedSegmentIndex = 0;
    }
    return _orientationControl;
}

- (UIButton *)actionButton
{
    if (!_actionButton) {
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_actionButton setTitle:@"Jump" forState:UIControlStateNormal];
        [_actionButton addTarget:self action:@selector(jumpAction) forControlEvents:UIControlEventTouchUpInside];
        _actionButton.backgroundColor = [UIColor orangeColor];
    }
    return _actionButton;
}


@end
