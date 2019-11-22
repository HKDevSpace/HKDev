//
//  HKConsoleManager.h
//  HKDev
//
//  Created by HK on 2019/4/17.
//  Copyright © 2019 HK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const HKConsoleLogUpdateNotification;

typedef NS_ENUM(NSInteger, HKConsoleLogType) {
    HKConsoleLogTypeAll,
    HKConsoleLogTypeInfo,
    HKConsoleLogTypeDebug,
    HKConsoleLogTypeError,
    HKConsoleLogTypeWarn,
};


@interface HKConsoleManager : NSObject

@property (nonatomic) HKConsoleLogType logType;

- (NSInteger)numberOfItems;
- (NSAttributedString *)itemAtIndex:(NSInteger)index;



- (void)info:(NSAttributedString *)log;
- (void)debug:(NSAttributedString *)log;
- (void)error:(NSAttributedString *)log;
- (void)warn:(NSAttributedString *)log;



@end

NS_ASSUME_NONNULL_END
