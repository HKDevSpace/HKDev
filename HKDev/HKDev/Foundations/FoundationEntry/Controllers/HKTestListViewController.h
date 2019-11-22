//
//  HKTestListViewController.h
//  HKDev
//
//  Created by HK on 2019/4/8.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKViewController.h"
@class HKTestListManager;

NS_ASSUME_NONNULL_BEGIN

@interface HKTestListViewController : HKViewController

- (instancetype)initWithManager:(HKTestListManager *)manager;

@end

NS_ASSUME_NONNULL_END
