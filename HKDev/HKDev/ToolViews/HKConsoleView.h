//
//  HKConsoleView.h
//  HKDev
//
//  Created by HK on 2019/4/12.
//  Copyright © 2019 HK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HKConsoleConfigure;

NS_ASSUME_NONNULL_BEGIN

@interface HKConsoleView : UIView

+ (HKConsoleView *)consoleView;
+ (HKConsoleView *)consoleViewWithConfigure:(HKConsoleConfigure *)configure;


- (void)info:(NSString *)log;
- (void)debug:(NSString *)log;
- (void)error:(NSString *)log;
- (void)warn:(NSString *)log;

@end

NS_ASSUME_NONNULL_END
