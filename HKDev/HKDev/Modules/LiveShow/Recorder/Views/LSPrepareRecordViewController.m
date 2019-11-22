//
//  HKPrepareRecordViewController.m
//  HKScreenRotateDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import "LSPrepareRecordViewController.h"
#import "LSRecorderViewController.h"
#import "HKNavigationController.h"
#import "Test.h"

#import <Masonry.h>

@interface LSPrepareRecordViewController ()

// UI
@property (strong, nonatomic) UIButton *backButton;

@property (strong, nonatomic) UISegmentedControl *recordOrientationSegment;
@property (strong, nonatomic) UISegmentedControl *recordShowingStyleSegment;
@property (strong, nonatomic) UIButton *startRecordButton;

@property (nonatomic, getter=isLandscape) BOOL landscape;

@end

@implementation LSPrepareRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViews];
    
    [self test];

}

- (void)test
{
    Test *test  = [[Test alloc] init];
    [test log];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}


#pragma mark - Action

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)changeOrientationAction:(UISegmentedControl *)control
{
    self.landscape = (control.selectedSegmentIndex == 1);
}

- (void)startRecordAction
{
    if (self.recordShowingStyleSegment.selectedSegmentIndex == 0) {
        // push
        LSRecorderViewController *recorderVC = [[LSRecorderViewController alloc] initWithLandscape:self.isLandscape];
        [self.navigationController pushViewController:recorderVC animated:YES];
    } else {
        
        // present
        LSRecorderViewController *recorderVC = [[LSRecorderViewController alloc] initWithLandscape:self.isLandscape];
        HKNavigationController *nav = [[HKNavigationController alloc] initWithRootViewController:recorderVC];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:^{
            
        }];
        
//        [self presentViewController:nav animated:NO completion:^{ }];
    }
}


#pragma mark - Private
- (void)setupViews
{
    self.title = @"Prepare Record";
    self.landscape = NO;
    
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.startRecordButton];
    [self.view addSubview:self.recordOrientationSegment];
    [self.view addSubview:self.recordShowingStyleSegment];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).with.offset(20.f);
    }];
    
    
    [self.recordOrientationSegment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(80.f);
        make.left.equalTo(self.view).with.offset(20.f);
    }];
    
    [self.recordShowingStyleSegment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.recordOrientationSegment.mas_bottom).with.offset(20.f);
        make.left.equalTo(self.recordOrientationSegment);
    }];

    [self.startRecordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.recordShowingStyleSegment.mas_bottom).with.offset(10.f);
        make.left.equalTo(self.backButton);
    }];
}

#pragma mark - Getter
- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setTitle:@"Back" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _backButton;
}

- (UIButton *)startRecordButton
{
    if (!_startRecordButton) {
        _startRecordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _startRecordButton.backgroundColor = [UIColor yellowColor];
        [_startRecordButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [_startRecordButton setTitle:@"Start Record" forState:UIControlStateNormal];
        [_startRecordButton addTarget:self action:@selector(startRecordAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _startRecordButton;
}

- (UISegmentedControl *)recordOrientationSegment
{
    if (!_recordOrientationSegment) {
        _recordOrientationSegment = [[UISegmentedControl alloc] initWithItems:@[@"Portrait", @"Landscape"]];
        [_recordOrientationSegment addTarget:self action:@selector(changeOrientationAction:) forControlEvents:UIControlEventValueChanged];
        _recordOrientationSegment.selectedSegmentIndex = 0;
    }
    return _recordOrientationSegment;
}

- (UISegmentedControl *)recordShowingStyleSegment
{
    if (!_recordShowingStyleSegment) {
        _recordShowingStyleSegment = [[UISegmentedControl alloc] initWithItems:@[@"Push", @"Present"]];
        _recordShowingStyleSegment.selectedSegmentIndex = 0;
    }
    return _recordShowingStyleSegment;
}

@end
