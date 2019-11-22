//
//  HKTransitionTargetViewController.h
//  HKDev
//
//  Created by HK on 2019/4/28.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HKTransitionTargetViewController : HKViewController

@property (strong, nonatomic) UIImage *beginImage;
@property (nonatomic) CGRect beginFrame;

@property (strong, nonatomic) UIImage *endImage;
@property (nonatomic) CGRect endFrame;


@end

NS_ASSUME_NONNULL_END
