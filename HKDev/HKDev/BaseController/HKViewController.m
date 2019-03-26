//
//  HKViewController.m
//  HKScreenRotateDev
//
//  Created by HK on 2019/3/14.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKViewController.h"

@interface HKViewController ()

@end

@implementation HKViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Set Background Color (WhiteColor)
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Rotate Control
// 默认不支持旋转
- (BOOL)shouldAutorotate
{
    return NO;
}

// 默认只支持竖屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

// 默认为竖屏显示
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end
