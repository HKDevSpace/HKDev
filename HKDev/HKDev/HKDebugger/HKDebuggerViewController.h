//
//  HKDebuggerViewController.h
//  HKDev
//
//  Created by HK on 2019/4/18.
//  Copyright © 2019 HK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HKDebuggerViewController;

NS_ASSUME_NONNULL_BEGIN


@protocol HKDebuggerViewControllerEventDelegate <NSObject>

- (void)exitEvent:(HKDebuggerViewController *)vc;

@end


@interface HKDebuggerViewController : UIViewController

@property (strong, nonatomic) id <HKDebuggerViewControllerEventDelegate> eventDelegate;

@end

NS_ASSUME_NONNULL_END
