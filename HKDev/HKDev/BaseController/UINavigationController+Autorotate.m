//
//  UINavigationController+Orientation.m
//  HKDev
//
//  Created by HK on 2019/4/10.
//  Copyright © 2019 HK. All rights reserved.
//

#import "UINavigationController+Autorotate.h"

@implementation UINavigationController (Autorotate)

#pragma mark - Autorotate
- (BOOL)shouldAutorotate
{
    return [self.visibleViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    NSLog(@"VisibleViewController :%@", self.visibleViewController);
    return [self.visibleViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
}

@end


