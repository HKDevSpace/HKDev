//
//  HKEntryListViewController.h
//  HKDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTableViewController.h"
#import "HKEntryListManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface HKEntryListViewController : HKTableViewController

- (instancetype)initWithManager:(HKEntryListManager *)manager;

@end

NS_ASSUME_NONNULL_END