//
//  HKTestListManager.m
//  HKDev
//
//  Created by HK on 2019/4/8.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTestListManager.h"
#import "HKTestListItem.h"
#import "HKTestListItem+Factory.h"

@interface HKTestListManager ()

@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation HKTestListManager

#pragma mark - Public
- (nullable instancetype)initWithType:(HKEntryType)type
{
    NSArray *config;
    NSString *title;
    switch (type) {
        case HKEntryTypeNSFoundation: {   // <Foundataion> 框架
            config = @[@(HKTestTypeNSObject),
                       @(HKTestTypeNSInvocation),
                       ];
            title = @"<Foundation>";
        } break;
        case HKEntryTypeUIKit: {          // <UIKit> 框架
            config = @[@(HKTestTypeUIView),
                       @(HKTestTypeUIColor),
                       @(HKTestTypeTransition),
                       ];
            title = @"<UIKit>";
        } break;
        case HKEntryTypeAVFoundation: {   // <AVFoundation> 框架
            config = @[@(HKTestTypeAVPlayer),
                       ];
            title = @"<AVFoundation>";
        } break;
        case HKEntryTypeThirdLibrary: {   // 第三方库
            config = @[@(HKTestTypeReactiveObjC),
                       @(HKTestTypeMasonry),
                       @(HKTestTypeYYKit),
                       ];
            title = @"ThirdLibrary";
        } break;
        default:
            break;
    }
    
    if (!config) {
        return nil;
    }
    
    NSArray *items = [HKTestListManager dataSourceWithConfig:config];
    self = [super init];
    if (self) {
        _title = title;
        [self.dataSource addObjectsFromArray:items];
    }
    
    return self;
}

// DataSource
- (NSInteger)numberOfItems
{
    return self.dataSource.count;
}

- (nullable HKTestListItem *)itemAtIndex:(NSUInteger)index
{
    if (index < self.dataSource.count) {
        return self.dataSource[index];
    }
    
    return nil;
}


#pragma mark - Private
+ (NSArray *)dataSourceWithConfig:(NSArray *)config
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (NSNumber *num in config) {
        HKTestType type = [num integerValue];
        HKTestListItem *item = [HKTestListItem testItemWithType:type];
        if (item) {
            [items addObject:item];
        }
    }
    return [items copy];
}


#pragma mark - Getter
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

@end
