//
//  HKPlayerViewController.m
//  HKScreenRotateDev
//
//  Created by HK on 2019/3/12.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKPlayerViewController.h"
#import <HKCategories/UIDevice+HKExtension.h>
#import <Masonry.h>

@interface HKPlayerViewController ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIButton *backButton;

@end

@implementation HKPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView).with.offset(10);
        make.top.equalTo(self.imageView).with.offset(10);
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)updateViewConstraints
{
    [self updateConstraints];
    
    [super updateViewConstraints];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    NSLog(@"Size:[%@], duration:[%@]", NSStringFromCGSize(size), coordinator);
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [self updateConstraints];
}

- (void)updateConstraints
{
    if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) {
        
        [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).with.offset(([UIDevice isNotchScreen] ? 44 : 20));
            make.left.equalTo(self.view).with.offset(10);
            make.right.equalTo(self.view).with.offset(-10);
            make.height.equalTo(self.imageView.mas_width).with.multipliedBy(9.f/16);
        }];
        

    } else if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft
               || [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight){
        
        [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
    }
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
//    return UIInterfaceOrientationMaskAllButUpsideDown;
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}

- (void)backAction
{
    if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) {
        
        if (self.navigationController) {
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            [self dismissViewControllerAnimated:YES completion:^{ }];
        }
        
    } else {
        
    }
}


- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Landscape"]];
        _imageView.backgroundColor = [UIColor blackColor];
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"Back25#FFFFFF"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

@end
