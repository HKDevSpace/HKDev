//
//  HKPrepareRecordViewController.m
//  HKScreenRotateDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKPrepareRecordViewController.h"

@interface HKPrepareRecordViewController ()

// UI
@property (strong, nonatomic) UILabel *showOrientationLabel;
@property (strong, nonatomic) UIButton *changeOrientationButton;

@property (nonatomic, getter=isLandscape) BOOL landscape;

@end

@implementation HKPrepareRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}


- (void)updateViewConstraints
{
    [super updateViewConstraints];
}



#pragma mark - Private
- (void)setupViews
{
    self.title = @"起播设置";
    self.landscape = NO;
    [self.view addSubview:self.showOrientationLabel];
    [self.view addSubview:self.changeOrientationButton];
}


#pragma mark - Setter
- (void)setLandscape:(BOOL)landscape
{
    _landscape = landscape;
    
    NSString *buttonTitle = @"Portrait";
    if (landscape) {
        buttonTitle = @"Landscape";
    }
    [self.changeOrientationButton setTitle:buttonTitle forState:UIControlStateNormal];
}

#pragma mark - Getter
- (UILabel *)showOrientationLabel
{
    if (!_showOrientationLabel) {
        _showOrientationLabel = [[UILabel alloc] init];
        _showOrientationLabel.textColor = [UIColor purpleColor];
    }
    
    return _showOrientationLabel;
}

- (UIButton *)changeOrientationButton
{
    if (!_changeOrientationButton) {
        _changeOrientationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _changeOrientationButton.backgroundColor = [UIColor orangeColor];
        [_changeOrientationButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }
    return _changeOrientationButton;
}

@end
