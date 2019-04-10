//
//  HKEntryListViewModel.h
//  HKDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HKEntryListItem.h"

NS_ASSUME_NONNULL_BEGIN


// If add or remove type, need to modify method(initWithType:)
typedef NS_ENUM(NSInteger, HKEntryListType) {
    HKEntryListTypeModules,
    HKEntryListTypeComponents,
    HKEntryListTypeFoundations,
};


@interface HKEntryListManager : NSObject

@property (nonatomic, readonly) HKEntryListType type;
@property (nonatomic, readonly, nullable) NSString *title;
@property (nonatomic, readonly, nullable) NSString *imageName;
@property (nonatomic, readonly, nullable) NSString *selectedImageName;

- (nullable instancetype)initWithType:(HKEntryListType)type;


// DataSource
- (NSInteger)numberOfItems;
- (nullable HKEntryListItem *)itemAtIndex:(NSUInteger)index;


@end

NS_ASSUME_NONNULL_END
