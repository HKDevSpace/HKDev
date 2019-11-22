//
//  UIViewController+Autorotate.m
//  HKDev
//
//  Created by HK on 2019/9/27.
//  Copyright © 2019 HK. All rights reserved.
//

#import "UIViewController+Autorotate.h"
#import <objc/runtime.h>

@implementation UIViewController (Autorotate)

#pragma mark - hk_autorotate
- (BOOL)hk_autorotate
{
    id autorotate = objc_getAssociatedObject(self, _cmd);
    
    if (autorotate) {
        return [autorotate boolValue];
    } else {
        return NO;
    }
}

- (void)setHk_autorotate:(BOOL)hk_autorotate
{
    objc_setAssociatedObject(self, @selector(hk_autorotate), @(hk_autorotate), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - hk_supportedInterface
- (UIInterfaceOrientationMask)hk_supportedInterface
{
    id mask = objc_getAssociatedObject(self, _cmd);
    if (mask) {
        return [mask unsignedIntegerValue];
    } else {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
}

- (void)setHk_supportedInterface:(UIInterfaceOrientationMask)hk_supportedInterface
{
    
    
    objc_setAssociatedObject(self, @selector(hk_supportedInterface), [NSNumber numberWithUnsignedInteger:hk_supportedInterface], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - hk_preferredInterfaceForPresentation
- (UIInterfaceOrientation)hk_preferredInterfaceForPresentation
{
    id orientation = objc_getAssociatedObject(self, _cmd);
    if (orientation) {
        return [orientation integerValue];
    } else {
        return UIInterfaceOrientationPortrait;
    }
}

- (void)setHk_preferredInterfaceForPresentation:(UIInterfaceOrientation)hk_preferredInterfaceForPresentation
{
    objc_setAssociatedObject(self, @selector(hk_preferredInterfaceForPresentation), [NSNumber numberWithUnsignedInteger:hk_preferredInterfaceForPresentation], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (BOOL)shouldAutorotate
{
    return self.hk_autorotate;
}

// 默认只支持竖屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return self.hk_supportedInterface;
}

// 默认为竖屏显示
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return self.hk_preferredInterfaceForPresentation;
}

@end
