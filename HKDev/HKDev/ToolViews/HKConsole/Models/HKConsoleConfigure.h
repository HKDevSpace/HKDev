//
//  HKConsoleConfigure.h
//  HKDev
//
//  Created by HK on 2019/4/16.
//  Copyright © 2019 HK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HKConsoleConfigure : NSObject

// Default: White
@property (strong, nonatomic) UIColor *infoColor;

// Default: Green
@property (strong, nonatomic) UIColor *debugColor;

// Default: Red
@property (strong, nonatomic) UIColor *errorColor;

// Default: Yellow
@property (strong, nonatomic) UIColor *warnColor;

// Default: YES
@property (nonatomic, getter=isShowTime) BOOL showTime;

@property (strong, nonatomic) UIFont *infoFont;
@property (strong, nonatomic) UIFont *debugFont;
@property (strong, nonatomic) UIFont *errorFont;
@property (strong, nonatomic) UIFont *warnFont;

+ (HKConsoleConfigure *)defaultConfig;

- (nullable NSAttributedString *)attributedInfoLog:(NSString *)infoLog;
- (nullable NSAttributedString *)attributedDebugLog:(NSString *)debugLog;
- (nullable NSAttributedString *)attributedErrorLog:(NSString *)errorLog;
- (nullable NSAttributedString *)attributedWarnLog:(NSString *)warnLog;

@end

NS_ASSUME_NONNULL_END
