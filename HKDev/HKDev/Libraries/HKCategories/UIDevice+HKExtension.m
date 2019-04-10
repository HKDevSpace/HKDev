//
//  UIDevice+HKExtension.m
//  HKDev
//
//  Created by HK on 2019/3/28.
//  Copyright © 2019 HK. All rights reserved.
//

#import "UIDevice+HKExtension.h"

@implementation UIDevice (HKExtension)

// 强制旋转屏幕方向
+ (void)setDeviceOrientation:(UIInterfaceOrientation)orientation
{
    // 如果设备方向本身就是需要旋转的方向，那么该方法将不起效
    // 此时需要先将设备旋转到一个其他方向，然后在设置回来
    [UIDevice forceDeviceToOrientation:UIInterfaceOrientationUnknown];
    [UIDevice forceDeviceToOrientation:orientation];

}

+ (void)forceDeviceToOrientation:(UIInterfaceOrientation)orientation
{

    if([[UIDevice currentDevice]respondsToSelector:@selector(setOrientation:)]) {
        
        SEL selector = NSSelectorFromString(@"setOrientation:");
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        
        // why 2 ? ->  Method default argument target(index_0), selector(index_1)
        [invocation setArgument:&orientation atIndex:2];
        
        [invocation invoke];
    }
    
    //  Or  [[UIDevice currentDevice] setValue:@(orientation) forKey:@"orientation"];
}

@end
