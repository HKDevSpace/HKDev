//
//  UIViewController+Autorotate.h
//  HKDev
//
//  Created by HK on 2019/9/27.
//  Copyright © 2019 HK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Autorotate)

@property (nonatomic) BOOL hk_autorotate;

@property (nonatomic) UIInterfaceOrientationMask hk_supportedInterface;

@property (nonatomic) UIInterfaceOrientation hk_preferredInterfaceForPresentation;

@end

NS_ASSUME_NONNULL_END
