//
//  HKNavigationController.m
//  HKScreenRotateDev
//
//  Created by HK on 2019/3/14.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKNavigationController.h"

@interface HKNavigationController ()

@end

@implementation HKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 该属性决定了navigationBar是否半透明
    // 默认为YES，当该属性为YES的时候，self.view 和 navigationController顶部对齐，即顶部与屏幕顶部对齐
    // 如果设置为NO, 那么 self.view 和 navigationBar 底部对齐
    self.navigationBar.translucent = NO;
}

#pragma mark - Rotate Control
- (BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

@end
