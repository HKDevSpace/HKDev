//
//  HKConsoleConfigure.m
//  HKDev
//
//  Created by HK on 2019/4/16.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKConsoleConfigure.h"
#import "UIFont+HKExtension.h"
#import "UIColor+HKExtension.h"
#import "NSObject+StringExtension.h"

#define ConsoleDefaultInfoLogColor    [UIColor whiteColor]
#define ConsoleDefaultgDebugLogColor  [UIColor greenColor]
#define ConsoleDefaultErrorLogColor   [UIColor redColor]
#define ConsoleDefaultWarnLogColor    [UIColor yellowColor]

#define ConsoleDefultInfoLogFont      [UIFont systemFontOfSize:13.f]
#define ConsoleDefultDebugLogFont     [UIFont systemFontOfSize:13.f]
#define ConsoleDefultErrorLogFont     [UIFont boldSystemFontOfSize:13.f]
#define ConsoleDefultWarnLogFont      [UIFont italicSystemFontOfSize:13.f]

static CGFloat const MinFontSize = 5.f;
static CGFloat const MaxFontSize = 30.f;

@implementation HKConsoleConfigure
@synthesize infoColor = _infoColor;
@synthesize debugColor = _debugColor;
@synthesize errorColor = _errorColor;
@synthesize warnColor  = _warnColor;
@synthesize infoFont = _infoFont;
@synthesize debugFont = _debugFont;
@synthesize errorFont = _errorFont;
@synthesize warnFont = _warnFont;

#pragma mark - Initilaization
+ (HKConsoleConfigure *)defaultConfig
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _showTime = YES;
        
        
    }
    return self;
}

#pragma mark - Public
- (nullable NSAttributedString *)attributedInfoLog:(NSString *)infoLog
{
    if ([infoLog isEmptyString]) {
        return nil;
    }
    NSAttributedString *attr
    = [[NSAttributedString alloc] initWithString:infoLog
                                      attributes:@{ NSFontAttributeName : self.infoFont,
                                                    NSForegroundColorAttributeName : self.infoColor }];
    return attr;
}

- (nullable NSAttributedString *)attributedDebugLog:(NSString *)debugLog
{
    if ([debugLog isEmptyString]) {
        return nil;
    }
    NSAttributedString *attr
    = [[NSAttributedString alloc] initWithString:debugLog
                                      attributes:@{ NSFontAttributeName : self.debugFont,
                                                    NSForegroundColorAttributeName : self.debugColor }];
    return attr;
}

- (nullable NSAttributedString *)attributedErrorLog:(NSString *)errorLog
{
    if ([errorLog isEmptyString]) {
        return nil;
    }
    NSAttributedString *attr
    = [[NSAttributedString alloc] initWithString:errorLog
                                      attributes:@{ NSFontAttributeName : self.errorFont,
                                                    NSForegroundColorAttributeName : self.errorColor }];
    return attr;
}

- (nullable NSAttributedString *)attributedWarnLog:(NSString *)warnLog
{
    if ([warnLog isEmptyString]) {
        return nil;
    }
    NSAttributedString *attr
    = [[NSAttributedString alloc] initWithString:warnLog
                                      attributes:@{ NSFontAttributeName : self.warnFont,
                                                    NSForegroundColorAttributeName : self.warnColor }];
    
    return attr;
}

#pragma mark - ˜Getter
- (UIColor *)infoColor
{
    if (!_infoColor) {
        return ConsoleDefaultInfoLogColor;
    }
    return _infoColor;
}

- (UIColor *)debugColor
{
    if (!_debugColor) {
        return ConsoleDefaultgDebugLogColor;
    }
    return _debugColor;
}

- (UIColor *)errorColor
{
    if (!_errorColor) {
        return ConsoleDefaultErrorLogColor;
    }
    return _errorColor;
}

- (UIColor *)warnColor
{
    if (!_warnColor) {
        return ConsoleDefaultWarnLogColor;
    }
    return _warnColor;
}

- (UIFont *)infoFont
{
    if (!_infoFont) {
        return ConsoleDefultInfoLogFont;
    }
    return _infoFont;
}

- (UIFont *)debugFont
{
    if (!_debugFont) {
        return ConsoleDefultDebugLogFont;
    }
    return _debugFont;
}

- (UIFont *)errorFont
{
    if (!_errorFont) {
        return ConsoleDefultErrorLogFont;
    }
    return _errorFont;
}

- (UIFont *)warnFont
{
    if (!_warnFont) {
        return ConsoleDefultWarnLogFont;
    }
    return _warnFont;
}

#pragma mark - Setter
- (void)setInfoColor:(UIColor *)infoColor
{
    if ([infoColor isEqualToClearColor]) {
        _infoColor = nil;
    } else {
        _infoColor = infoColor;
    }
}

- (void)setDebugColor:(UIColor *)debugColor
{
    if ([debugColor isEqualToClearColor]) {
        _debugColor = nil;
    } else {
        _debugColor = debugColor;
    }
}

- (void)setErrorColor:(UIColor *)errorColor
{
    if ([errorColor isEqualToClearColor]) {
        _errorColor = nil;
    } else {
        _errorColor = errorColor;
    }
}

- (void)setWarnColor:(UIColor *)warnColor
{
    if ([warnColor isEqualToClearColor]) {
        _warnColor = nil;
    } else {
        _warnColor = warnColor;
    }
}

- (void)setInfoFont:(UIFont *)infoFont
{
    if (infoFont.pointSize < MinFontSize || infoFont.pointSize > MaxFontSize) {
        _infoFont = nil;
    } else {
        _infoFont = infoFont;
    }
}

- (void)setDebugFont:(UIFont *)debugFont
{
    if (debugFont.pointSize < MinFontSize || debugFont.pointSize > MaxFontSize) {
        _debugFont = nil;
    } else {
        _debugFont = debugFont;
    }
}

- (void)setErrorFont:(UIFont *)errorFont
{
    if (errorFont.pointSize < MinFontSize || errorFont.pointSize > MaxFontSize) {
        _errorFont = nil;
    } else {
        _errorFont = errorFont;
    }
}

- (void)setWarnFont:(UIFont *)warnFont
{
    if (warnFont.pointSize < MinFontSize || warnFont.pointSize > MaxFontSize) {
        _warnFont = nil;
    } else {
        _warnFont = warnFont;
    }
}


@end
