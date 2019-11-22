//
//  HKDebugger.m
//  HKDev
//
//  Created by HK on 2019/4/18.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKDebugger.h"
#import "HKDebuggerViewController.h"
#import <HKCategories/UIResponder+HKExtension.h>

#define HKDebuggerInstance [HKDebugger debugger]


@interface HKDebugger() <HKDebuggerViewControllerEventDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

@implementation HKDebugger


#pragma mark Public

+ (void)show
{
    HKDebuggerInstance.window.hidden = NO;
    
    Info(@"%@, %d", @"HHHH", 123);

}


void Info(NSString *formatString, ...)
{
    va_list args;
    va_start(args, formatString);
    NSString *string = [[NSString alloc] initWithFormat:formatString arguments:args];
    va_end(args);
    
    
    NSLog(@"%@", string);
    
}


#pragma mark - <HKDebuggerViewControllerEventDelegate>
- (void)exitEvent:(HKDebuggerViewController *)vc
{
    self.window.hidden = YES;
}

#pragma mark - Singleton 
static HKDebugger *_instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)debugger
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

#pragma mark - Getter
- (UIWindow *)window
{
    if (!_window) {
        CGRect frame = [UIScreen mainScreen].bounds;
        _window = [[UIWindow alloc] initWithFrame:frame];
        HKDebuggerViewController *debuggerVC  = [[HKDebuggerViewController alloc] init];
        debuggerVC.eventDelegate  = self;
        _window.rootViewController = debuggerVC;
        _window.windowLevel = UIWindowLevelStatusBar + 1;
    }
    return _window;
}

@end
