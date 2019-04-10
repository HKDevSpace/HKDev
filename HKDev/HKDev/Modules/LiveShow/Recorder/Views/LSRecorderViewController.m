//
//  HKRecorderViewController.m
//  HKScreenRotateDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import "LSRecorderViewController.h"
#import "LSAnchorInfoViewController.h"

#import "UIDevice+HKExtension.h"
#import <Masonry.h>

@interface LSRecorderViewController ()
{
    // 针对present方式弹出 LSRecorderViewController， 在返回事件中需要将方向设置为主方向，否则crash.
    UIInterfaceOrientationMask supportedOrientationMask;
}

@property (strong, nonatomic) UILabel *orientationLabel;
@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UIButton *anchorInfoButton;

@property (nonatomic, getter=isLandscape) BOOL landscape;

@end

@implementation LSRecorderViewController

- (instancetype)initWithLandscape:(BOOL)landscape
{
    self = [super init];
    if (self) {
        _landscape = landscape;
        if (landscape) {
            supportedOrientationMask = UIInterfaceOrientationMaskLandscapeLeft;
        } else {
            supportedOrientationMask = UIInterfaceOrientationMaskPortrait;
        }
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViews];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;

    if (self.isLandscape) {
        [UIDevice setDeviceOrientation:UIInterfaceOrientationLandscapeLeft];
    }
    [self updateLayout];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    if (self.isLandscape) {
        [UIDevice setDeviceOrientation:UIInterfaceOrientationPortrait];
    }
}


#pragma mark - Action
- (void)backAction
{
    
    supportedOrientationMask = UIInterfaceOrientationMaskAllButUpsideDown;
    
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count == 1) {
            // 如果 Animated 是YES, 会导致先推出，然后旋转
            [self.navigationController dismissViewControllerAnimated:NO completion:^{ }];
        } else {
            [self.navigationController popViewControllerAnimated:NO];
        }
    } else {
        [self dismissViewControllerAnimated:YES completion:^{ }];
    }
}

- (void)showAnchorInfoAction
{
    LSAnchorInfoViewController *anchorInfoVC = [[LSAnchorInfoViewController alloc] init];
    [self.navigationController pushViewController:anchorInfoVC animated:YES];
}

#pragma mark - Private
- (void)setupViews
{
    [self.view addSubview:self.orientationLabel];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.anchorInfoButton];
}

#pragma mark - Rotate
- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return supportedOrientationMask;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    if (self.isLandscape) {
        return UIInterfaceOrientationLandscapeLeft;
    } else {
        return UIInterfaceOrientationPortrait;
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    NSLog(@"Changed Rotate:[%@]", NSStringFromCGSize(size));
    [self updateLayout];
}


- (void)updateLayout
{
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait) { // Landscape

        [self.orientationLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
        
        [self.backButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.view).with.offset(20.f);
        }];
        
        [self.anchorInfoButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.equalTo(self.view).with.offset(-20.f);
        }];
        
    } else { // Portrait
        
        [self.orientationLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(100, 10, 100, 10));
        }];
        
        [self.backButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.view).with.offset(20.f);
        }];
        
        [self.anchorInfoButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).with.offset(20.f);
            make.right.equalTo(self.view).with.offset(-20.f);
        }];
    }
    
}


#pragma mark - Setter
- (void)setLandscape:(BOOL)landscape
{
    _landscape = landscape;
    
    self.orientationLabel.text = landscape?@"Landscape": @"Portrait";
}

#pragma mark - Getter
- (UILabel *)orientationLabel
{
    if (!_orientationLabel) {
        _orientationLabel = [[UILabel alloc] init];
        _orientationLabel.backgroundColor = [UIColor yellowColor];
        _orientationLabel.font = [UIFont boldSystemFontOfSize:30.f];
        _orientationLabel.textColor = [UIColor purpleColor];
    }
    
    return _orientationLabel;
}

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

- (UIButton *)anchorInfoButton
{
    if (!_anchorInfoButton) {
        _anchorInfoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _anchorInfoButton.backgroundColor = [UIColor greenColor];
        [_anchorInfoButton setTitle:@"Anchor Info" forState:UIControlStateNormal];
        [_anchorInfoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_anchorInfoButton addTarget:self action:@selector(showAnchorInfoAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _anchorInfoButton;
}


@end
