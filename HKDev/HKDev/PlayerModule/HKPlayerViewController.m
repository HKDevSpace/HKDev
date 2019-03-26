//
//  HKPlayerViewController.m
//  HKScreenRotateDev
//
//  Created by HK on 2019/3/12.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKPlayerViewController.h"

#import <Masonry.h>

@interface HKPlayerViewController ()

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation HKPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.imageView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
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
    
//    [self updateConstraints];
}

- (void)updateConstraints
{
    if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) {
        
        [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).with.offset(20);
            make.left.equalTo(self.view).with.offset(10);
            make.right.equalTo(self.view).with.offset(-10);
            make.height.equalTo(self.imageView.mas_width).with.multipliedBy(9.f/16);
        }];

    } else if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft
               || [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight){
        
        [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(20, 10, -10, 10));
        }];
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
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

@end
