//
//  HKTestListManager.h
//  HKDev
//
//  Created by HK on 2019/4/8.
//  Copyright © 2019 HK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HKEntryListDefine.h"
@class HKTestListItem;

NS_ASSUME_NONNULL_BEGIN

@interface HKTestListManager : NSObject

@property (nonatomic, readonly) HKEntryType type;
@property (nonatomic, readonly, nullable) NSString *title;

- (nullable instancetype)initWithType:(HKEntryType)type;


// DataSource
- (NSInteger)numberOfItems;
- (nullable HKTestListItem *)itemAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
