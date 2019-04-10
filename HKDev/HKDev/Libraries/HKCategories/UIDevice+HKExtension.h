//
//  UIDevice+HKExtension.h
//  HKDev
//
//  Created by HK on 2019/3/28.
//  Copyright © 2019 HK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (HKExtension)

// 强制旋转屏幕方向
+ (void)setDeviceOrientation:(UIInterfaceOrientation)orientation;

@end

NS_ASSUME_NONNULL_END
