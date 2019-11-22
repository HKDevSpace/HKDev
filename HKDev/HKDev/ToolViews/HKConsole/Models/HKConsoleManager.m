//
//  HKConsoleManager.m
//  HKDev
//
//  Created by HK on 2019/4/17.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKConsoleManager.h"
#import "NSObject+StringExtension.h"

NSString * const HKConsoleLogUpdateNotification = @"HKConsoleLogUpdateNotification";

@interface HKConsoleManager()

@property (strong, nonatomic, readonly) NSArray *dataSource;

@property (strong, nonatomic) NSMutableArray *allLogs;
@property (strong, nonatomic) NSMutableArray *infoLogs;
@property (strong, nonatomic) NSMutableArray *debugLogs;
@property (strong, nonatomic) NSMutableArray *errorLogs;
@property (strong, nonatomic) NSMutableArray *warnLogs;

@end

@implementation HKConsoleManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _logType = HKConsoleLogTypeAll;
    }
    return self;
}

#pragma mark - Data source
- (NSInteger)numberOfItems
{
    return self.dataSource.count;
}

- (NSAttributedString *)itemAtIndex:(NSInteger)index
{
    if (index < 0 || index > self.dataSource.count - 1) {
        return nil;
    }
    return [self.dataSource objectAtIndex:index];
}


#pragma mark - Logs
- (void)info:(NSAttributedString *)log
{
    if ([log isEmptyAttributedString]) {
        return;
    }
    
    [self.allLogs addObject:log];
    [self.infoLogs addObject:log];
    if (self.logType == HKConsoleLogTypeAll || self.logType == HKConsoleLogTypeInfo) {
        [[NSNotificationCenter defaultCenter] postNotificationName:HKConsoleLogUpdateNotification object:nil];
    }
}

- (void)debug:(NSAttributedString *)log
{
    if ([log isEmptyAttributedString]) {
        return;
    }
    
    [self.allLogs addObject:log];
    [self.debugLogs addObject:log];
    if (self.logType == HKConsoleLogTypeAll || self.logType == HKConsoleLogTypeDebug) {
        [[NSNotificationCenter defaultCenter] postNotificationName:HKConsoleLogUpdateNotification object:nil];
    }
}

- (void)error:(NSAttributedString *)log
{
    if ([log isEmptyAttributedString]) {
        return;
    }
    
    [self.allLogs addObject:log];
    [self.errorLogs addObject:log];
    if (self.logType == HKConsoleLogTypeAll || self.logType == HKConsoleLogTypeError) {
        [[NSNotificationCenter defaultCenter] postNotificationName:HKConsoleLogUpdateNotification object:nil];
    }
}

- (void)warn:(NSAttributedString *)log
{
    if ([log isEmptyAttributedString]) {
        return;
    }
    
    [self.allLogs addObject:log];
    [self.warnLogs addObject:log];
    if (self.logType == HKConsoleLogTypeAll || self.logType == HKConsoleLogTypeWarn) {
        [[NSNotificationCenter defaultCenter] postNotificationName:HKConsoleLogUpdateNotification object:nil];
    }
}


- (NSArray *)dataSource
{
    switch (self.logType) {
        case HKConsoleLogTypeAll:
            return [self.allLogs copy];
        case HKConsoleLogTypeInfo:
            return [self.infoLogs copy];
        case HKConsoleLogTypeDebug:
            return [self.debugLogs copy];
        case HKConsoleLogTypeError:
            return [self.errorLogs copy];
        case HKConsoleLogTypeWarn:
            return [self.warnLogs copy];
        default:
            break;
    }
    
    return nil;
}


#pragma mark - Setter
- (void)setLogType:(HKConsoleLogType)logType
{
    if (_logType != logType) {
        _logType = logType;
        [[NSNotificationCenter defaultCenter] postNotificationName:HKConsoleLogUpdateNotification object:nil];
    }
}

#pragma mark - Getter
- (NSMutableArray *)allLogs
{
    if (!_allLogs) {
        _allLogs = [[NSMutableArray alloc] init];
    }
    return _allLogs;
}

- (NSMutableArray *)infoLogs
{
    if (!_infoLogs) {
        _infoLogs = [[NSMutableArray alloc] init];
    }
    return _infoLogs;
}

- (NSMutableArray *)debugLogs
{
    if (!_debugLogs) {
        _debugLogs = [[NSMutableArray alloc] init];
    }
    return _debugLogs;
}

- (NSMutableArray *)errorLogs
{
    if (!_errorLogs) {
        _errorLogs = [[NSMutableArray alloc] init];
    }
    return _errorLogs;
}

- (NSMutableArray *)warnLogs
{
    if (!_warnLogs) {
        _warnLogs = [[NSMutableArray alloc] init];
    }
    return _warnLogs;
}

@end
