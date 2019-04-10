//
//  HKNavigationController.m
//  HKScreenRotateDev
//
//  Created by HK on 2019/3/14.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKNavigationController.h"
#import <YYKit/UIColor+YYAdd.h>

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
    
//    [[UINavigationBar appearance] setBackgroundColor:[UIColor orangeColor]];
//    [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
//    self.navigationBar.backgroundColor = [UIColor orangeColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationBar.barTintColor = [UIColor colorWithHexString:@"1296DB"];// colorWithHex:0x1A4F95 alpha:1.f];
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
    
    // 返回按钮颜色
//    self.navigationBar.tintColor = [UIColor whiteColor];
    
    // 设置系统返回按钮图片
    self.navigationBar.backIndicatorImage = [UIImage imageNamed:@"Back20#FFFFFF"];
    self.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"Back20#FFFFFF"];
    
}



#pragma mark - Override
// hidesBottomBarWhenPushed setting
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController isKindOfClass:[UITabBarController class]]) {
        viewController.hidesBottomBarWhenPushed = NO;
    } else {
        if (self.viewControllers.count == 1) {
            viewController.hidesBottomBarWhenPushed = YES;
        }
    }
    [super pushViewController:viewController animated:animated];
}



@end
