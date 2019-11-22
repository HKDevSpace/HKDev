//
//  HKEntryListViewModel.m
//  HKDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKEntryListManager.h"
#import "HKEntryListItem+Factory.h"

@interface HKEntryListManager ()

@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation HKEntryListManager

#pragma mark - Public

- (nullable instancetype)initWithType:(HKEntryListType)type;
{
    // Guard
    if (type < HKEntryListTypeModules || type > HKEntryListTypeFoundations) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        
        _type = type;
        
        [self setupPropertiesWithType:type];
        [self createDataSourceWithType:type];
    }
    
    return self;
}

// DataSource
- (NSInteger)numberOfItems
{
    return self.dataSource.count;
}

- (nullable HKEntryListItem *)itemAtIndex:(NSUInteger)index
{
    if (index < self.dataSource.count) {
        return self.dataSource[index];
    }
    return nil;
}

#pragma mark - Private
- (void)setupPropertiesWithType:(HKEntryListType)type
{
    switch (self.type) {
        case HKEntryListTypeModules:
            _title = @"Modules";
            _imageName = @"TabBarModule";
            _selectedImageName = @"TabBarModuleSelected";
//            _selectedImageName = @"TabBarModuleSelected";
            break;
        case HKEntryListTypeComponents:
            _title = @"Components";
            _imageName = @"TabBarComponent";
            _selectedImageName = @"TabBarComponentSelected";
            break;
        case HKEntryListTypeFoundations:
            _title = @"Foundations";
            _imageName = @"TabBarFoundation";
            _selectedImageName = @"TabBarFoundationSelected";
            break;
        default:
            break;
    }
}

- (void)createDataSourceWithType:(HKEntryListType)type
{
    NSArray *types = [HKEntryListManager itemTypesWithType:type];
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (NSNumber *tempType in types) {
        HKEntryType type = (HKEntryType)[tempType integerValue];
        HKEntryListItem *item = [HKEntryListItem entryListItemWithType:type];
        if (item) {
            [items addObject:item];
        }
    }
    
    self.dataSource = [items copy];
}


#pragma mark - Tools

// 获取功能列表 NSArray <HKEntryType> *
+ (NSArray *)itemTypesWithType:(HKEntryListType)type
{
    NSArray *items;
    switch (type) {
            case HKEntryListTypeModules : {
                items = @[ @(HKEntryTypeLiveShow),  // 直播
                           @(HKEntryTypeVOD),       // 传统播放 （video on demand）
                           @(HKEntryTypeChat),      // 聊天
                           ];
                
            } break;
            case HKEntryListTypeComponents : {
                items = @[ @(HKEntryTypeBanner),         // 轮播
                           @(HKEntryTypePhotoPicker),
                           @(HKEntryTypeInputTextView),  // 输入框
                           ];
                           
            } break;
            case HKEntryListTypeFoundations : {
                items = @[ @(HKEntryTypeNSFoundation),  // Foundation Framework
                           @(HKEntryTypeUIKit),         // UIKit Framework
                           @(HKEntryTypeAVFoundation),  // AVFoundation Framework
                           @(HKEntryTypeThirdLibrary),  // Third Library
                           ];
                
            } break;
        default:
            break;
    }
    
    return items;
}

@end
