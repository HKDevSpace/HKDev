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
    
    [self hideNavigationBackButtonTitle];

}


#pragma mark - Private

// 隐藏返回按钮标题
- (void)hideNavigationBackButtonTitle
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
}



#pragma mark - Autorotate
- (BOOL)shouldAutorotate
{
    return YES;
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
