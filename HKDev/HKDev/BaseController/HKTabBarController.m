//
//  HKTabBarController.m
//  HKScreenRotateDev
//
//  Created by HK on 2019/3/14.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTabBarController.h"

#import <UIColor+YYAdd.h>

@interface HKTabBarController ()

@end

@implementation HKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 该属性决定了tabBar是否半透明
    // 默认为YES，当该属性为YES的时候，self.view 和 tabBar 底部对齐，即顶部与屏幕底部对齐
    // 如果设置为NO, 那么 self.view 和 tabBar 顶部对齐
    self.tabBar.translucent = NO;

    // Backgroud
    self.tabBar.clipsToBounds = YES;
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"GrayBlueBackground"]];
    [self.tabBar setShadowImage:[UIImage new]];
    
    // Item Title Color
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithWhite:1 alpha:1.0],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"8a8a8a"],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
}


@end
